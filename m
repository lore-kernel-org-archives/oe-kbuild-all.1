Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC482405E3;
	Tue, 18 Nov 2025 19:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494270; cv=none; b=XN8vOJYWg8nbNgCbkL+Ki5kB0eQivl8rY1x4tP2M6hNQBWW1MVCayof0S89818jvSU8Pmttkjtm2k2Hici9hiMjUZhBqA+dmV3LToTYtwJgg/Y0T7OvhhyZce8m2dPCDnL1aw+OWhLd38xV44gZiH6AGW0DjynGAet5Cpk1QLKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494270; c=relaxed/simple;
	bh=W9hxZgNhP9bQB7dpmq56MnomwGuHChdXKYKQO93W9d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDIzHRP7bGSZ5+U9GP58oTvkofu0QiwGSkdVn/g/4fEctL5dda/HJ17QiPhf7/6f7JDMYCaseXqbeVyMbIHGGCWIrTBU6q6xGjI9/JsVRmVRZMyuQWNlyz64Gnnid+7Zn1GoNB10h8zg1YOb3J1gIADe4USsC+MXKGHP3HmZMVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsfK/PCo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsfK/PCo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F64C2BCB4;
	Tue, 18 Nov 2025 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763494268;
	bh=W9hxZgNhP9bQB7dpmq56MnomwGuHChdXKYKQO93W9d4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AsfK/PCoxXNdz9HJx8mcQLJAlpuQx5z5GCj8Xd70NZQfSr+oFaCKYeIcIshqEoNr0
	 MZK7E5NGF2emsoPXNhZcfUqswrxY6UDS71SJV6za0uzoedPkdWxNvvjQC0LDgbnru/
	 9pmekzlNJRmAUZfLw7Sc7UNl8/90wPS3NjX3ZEfbQrzaAAiom76tv80nsixhVBd7yq
	 uKxHgZZSUkuappW44t2OaNDOHofvL2ep+6A5xfYpBDvqd7zAfpGHWkgosiQto51nMF
	 +JJgGGZT0adcDM2DTtEdsOa7eq3+As7qmP460LWHT6jQYPKFRJd17RbHOmpsC+9Adi
	 LVL+nyaFoE2Dg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 617DBCE0C98; Tue, 18 Nov 2025 11:31:06 -0800 (PST)
Date: Tue, 18 Nov 2025 11:31:06 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:dev.2025.11.13a 25/27] ERROR: modpost:
 "tasklist_lock" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <61008ab6-f766-4c5e-97c6-cdc0e55a6ac0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202511181007.iHxSV1IG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511181007.iHxSV1IG-lkp@intel.com>

On Tue, Nov 18, 2025 at 11:02:47AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.11.13a
> head:   38cc1fc7cc9d7c9ed5275c1e78256431da7721c5
> commit: 8b6753ddeaa69d04d6ff8b3bee0bf81a0607d396 [25/27] rcutorture: Add a textbook-style trivial preemptible RCU
> config: x86_64-randconfig-101-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181007.iHxSV1IG-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181007.iHxSV1IG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511181007.iHxSV1IG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "tasklist_lock" [kernel/rcu/rcutorture.ko] undefined!

Good catch, thank you!  I moved the calling function out of the module
into the main kernel.

							Thanx, Paul
