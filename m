Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED403242DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149281; cv=none; b=LAW8LCO5aTMZWrfCDIDIdYG/xPl1o9+z5mxrLfPoXYPTELU39ED7DTF658m/eEst2kZs8k8yYELc3CiN4LzIR+je5wicKptu45G0Mg5hQKFtX1lxwfJQ7uNE+pvxFIsH+UQVhYwRpIQh2SPPyBMw/6ocVi/8ETiujhlOMikq+/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149281; c=relaxed/simple;
	bh=hFCkNShrKkRni63liXUNQVzh01fqFy+VEzS0LGO4OZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAq+iwunojwawyys5BOBIgd2qe3a/42+Bf7PSknR5bNduEhXeg2iN/DAXxifRWcGt8VNec6QoRB2nAXASeQARglHtQ251l3gHE03yVoa9SDyqIaOaxExtyJTe3HWFc6D4SmW/lXdawrCG4tXbh1LL2nRcKYs2JyEn4HRUs2sxW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6527FEC;
	Fri, 19 Dec 2025 05:01:00 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C6C33F73F;
	Fri, 19 Dec 2025 05:01:06 -0800 (PST)
Date: Fri, 19 Dec 2025 13:01:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Subject: Re: [linux-next:master 1388/2322] vmlinux.o: warning: objtool:
 lkdtm_PANIC_IN_HARDIRQ(): unexpected end of section
 .text.lkdtm_PANIC_IN_HARDIRQ
Message-ID: <aUVMkNzi5L80EoJv@arm.com>
References: <202512190111.jxFSqxUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512190111.jxFSqxUH-lkp@intel.com>

On Fri, Dec 19, 2025 at 01:56:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1058ca9db0edaedcb16480cc74b78ed06f0d1f54
> commit: eb972eab0794dedeef5b3b1845e5f9a78793f184 [1388/2322] lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
> config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190111.jxFSqxUH-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190111.jxFSqxUH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512190111.jxFSqxUH-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: lkdtm_PANIC_IN_HARDIRQ(): unexpected end of section .text.lkdtm_PANIC_IN_HARDIRQ
> >> vmlinux.o: warning: objtool: lkdtm_BUG_IN_HARDIRQ(): unexpected end of section .text.lkdtm_BUG_IN_HARDIRQ

I think the while (...); confuses clang and objtool. I'll add this diff
on top, it seems to silence it:

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index fa05d77acb55..502059078b45 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -120,8 +120,8 @@ static void lkdtm_PANIC_IN_HARDIRQ(void)
 			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);

-	while (wait_for_panic)
-		;
+	while (READ_ONCE(wait_for_panic))
+		cpu_relax();

 	hrtimer_cancel(&timer);
 }
@@ -150,8 +150,8 @@ static void lkdtm_BUG_IN_HARDIRQ(void)
 			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);

-	while (wait_for_bug)
-		;
+	while (READ_ONCE(wait_for_bug))
+		cpu_relax();

 	hrtimer_cancel(&timer);
 }

Thanks for the report.

-- 
Catalin
