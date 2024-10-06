Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F4B56446
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728227462; cv=none; b=TKQBFEvx/abbcgCGmcvvjC5ounrJTBJrxElmFzhz2JihCZbNHOmGYTJVYs1sd6CfFVRqUsPbjQCW+/hOFPR2a2wC2+zEvP/USRraRfsevHxxOdE1DiHA/uoIXQx0HVboEmnoQOGpBTVw4VRG/n5eLsdLtSNg2ju+qGN/AxBCrfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728227462; c=relaxed/simple;
	bh=TAGDYQL4Ag5hgRhNjRSsMyhD8Ir2jE46LH4oZIIiYyw=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=uIAHjbU0vhzl42EtVDpXBbRHwDdxv/H78noZJah8PihOzWnwVI+RlnZDAAxpYhz66hhQHMQhfk7AihheaOssdtNGIZnbTjNSV/zCMV3F6yfeDPMv/q2tSO6e58ujEs9wnDC8YFeiPY+xyJ1CikjgWl/FR8KpnIUKb/OwjMq5MBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=mTnkwpsW; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="mTnkwpsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3/Q/w/5CU1XhKZEoTDmyoMSHhC3Gmxb9sd48sHYRhk=;
  b=mTnkwpsWUm7qBEMYOZHeM57muNBh8IvXOiNKuHkAumfQf8Ua7V8fh9cs
   vUZHZgCoWiteRKHskP6el1C2xxH7Tl5zlNxK0AFXfYmlzUoV/RiSk8/Zs
   CyFcX35IkiwXy2I03lLa9dFDemkscNryjQGc9SIdBcZRCFNRoZSzoOFyv
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,182,1725314400"; 
   d="scan'208";a="98329763"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 17:10:58 +0200
Date: Sun, 6 Oct 2024 17:10:57 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Ritesh Harjani <riteshh@linux.ibm.com>
cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.dev
Subject: fs/ext4/mballoc.c:4597:47-50: opportunity for str_yes_no(ret)
 (fwd)
Message-ID: <alpine.DEB.2.22.394.2410061710220.12182@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 6 Oct 2024 22:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ext4/mballoc.c:4597:47-50: opportunity for str_yes_no(ret)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ritesh Harjani <riteshh@linux.ibm.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f602276d3902642fdc3429b548d73c745446601
commit: 07b5b8e1ac4004b7db1065a301df65cd434c31c9 ext4: mballoc: introduce pcpu seqcnt for freeing PA to improve ENOSPC handling
date:   4 years, 4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 years, 4 months ago
config: x86_64-randconfig-102-20241006 (https://download.01.org/0day-ci/archive/20241006/202410062256.BoynX3c2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410062256.BoynX3c2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/mballoc.c:4597:47-50: opportunity for str_yes_no(ret)

vim +4597 fs/ext4/mballoc.c

c9de560ded61fa Alex Tomas     2008-01-29  4577
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4578  static bool ext4_mb_discard_preallocations_should_retry(struct super_block *sb,
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4579  			struct ext4_allocation_context *ac, u64 *seq)
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4580  {
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4581  	int freed;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4582  	u64 seq_retry = 0;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4583  	bool ret = false;
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4584
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4585  	freed = ext4_mb_discard_preallocations(sb, ac->ac_o_ex.fe_len);
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4586  	if (freed) {
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4587  		ret = true;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4588  		goto out_dbg;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4589  	}
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4590  	seq_retry = ext4_get_discard_pa_seq_sum();
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4591  	if (seq_retry != *seq) {
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4592  		*seq = seq_retry;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4593  		ret = true;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4594  	}
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4595
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4596  out_dbg:
07b5b8e1ac4004 Ritesh Harjani 2020-05-20 @4597  	mb_debug(sb, "freed %d, retry ? %s\n", freed, ret ? "yes" : "no");
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4598  	return ret;
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4599  }
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4600

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
