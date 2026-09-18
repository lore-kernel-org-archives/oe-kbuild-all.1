Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC919451996
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710141; cv=none; b=QfIIMuUy+aHwR0zLppg6p7zP3CsYgerDdC4YfShekVyiWjXEvlpoG7UajULKhnzo8l/1yHeQyhMdrWmFzaNkoupvN+4yZ352PeXgjZEQY/bNMrGw4JuHkNg5r/46Kkp2oZtb+LIPWyeImJoMwUl48hG4/6Y4Hxc6pBgBBqVgguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710141; c=relaxed/simple;
	bh=yVWYCAES8eEILc/q59oilzjuq+NKlghMwE3gBcGq3ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt8VRkV0esKdx4rskMNnPoK4cmaFq9Ax7oYgU9pLqjNc9CthsPaN9LaeoxU0CmDa2n0+byP+7FqtpoI4Yqo78/74eWa0Ad24xoDfKxDiyALsC3UeAWUjAP4qny1VUbc1ASfLd5Z6ldj0CYzAWdtxq4HAKpoCVUsa3BIDwUA/V5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUOjuiCW; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUOjuiCW"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc515bef69dso193424a12.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 22:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789710139; x=1790314939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibODzx/cfdGUU+chUXT4raQ1MJ3/BzeHLiGxfxTtRwo=;
        b=qUOjuiCWEseD0MaRz38tgXCsSrK1f/eZAW3FFBO3rwBEj7FMmuXKbpDh/88OCH08PL
         JIUxKcjXqq9sb0GdMK8o3DmIzmJ4IoSuXf0a1Qy/y7CpExxjNowK8F3x03kPfV7usoIx
         Xm75LJYpIu1XV6aiIcC53F+w0d5w3agphbBlTr7E7kQi8OIsHY5XVPgx1eg7zX7UVvzA
         6lNN4p69cJevi7IRuQKoVCw0lFeoKpqkjw7v+zu8ch9XbKHJjwPxI4HKrdlMAyX9PI0w
         ATwQtLdJJbgkATKZ/bbEpYAF3Ey/mpG0RqhZss7wduVg42i0umggVhnMAoy7/JUesNXM
         Qrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789710139; x=1790314939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibODzx/cfdGUU+chUXT4raQ1MJ3/BzeHLiGxfxTtRwo=;
        b=nTgmT8zXpiWccC0KAJHqwZQdiXan/7ubKFRQRyUJfpvOk84w35FLNSF1S2rPIdZUVU
         8pAIwTCMzNgnCe3iNlnyAVvdjEjgZfWgJ4J8Su/1ZL7tor97DbwXcV7NPxbdL3P78LYb
         AlOOuvyxfineQwW93fTElo6ciPjgK0IYUveuLpqDrelO+sB6+HU+6KJ39t4q7O5AhC9a
         29EN4VI0CkA4kKVH9eEe0s7TT3zVgbKRIAgIXT2IqXFI6/aRjHFtmjPXW9ETRjsVajb6
         um1oCHCmGWRgrAbfYUHCY6Gdyy+TwNQvpalA5eqvbgbGFMWbbD1gP5Dikuw23sdwZuCV
         wTOg==
X-Gm-Message-State: AFuF++mIKDTyWUB39Xg6PF3omBK/Z1jQbxavexSqGzxVN6JWTUGUXxYR
	mIXvJfzubbEgtQgh1Dn2Nyis3PIBpNMLvmMutTEOVLN3qfGQ77Xvo/0w
X-Gm-Gg: AYBFou1efTsfumm6cDxDluku+xxSPA7oFR8M/m9aePm54ETR8VFqwB/m4L8EvyYEjqu
	rkUr3NmB2+xPA85hqzU4Pk9HoDfoc/kRbYMd6sFiIkBbiWSFRI7YumpnvVapOy1XTBBRzMmT3YN
	ywkEbMwUrxSQHKjN116FgHLnxT7M8dowbYwzfvk7M8tgdVvKiMbVQ+2pGM8uTa/JPZrpqlKO7Lw
	R02++XlDZBYP9tLI7ZfZbbiows77+ZckCj8gN44/7E7eMIX4vJI1h/U9uGWW2O2Glw8Wvd9PhuE
	wCUUIdcK99jm+TQ0HJIKaZqZ3eOzYSKa/mTTsIU4drFUL40yiUekQL8S5rUbs8LyUUqHsMVjV+t
	985/0Und6xx10QeY7vaBCKHGSTljsDnoUZgDas9ssDFiRclNeRxHPeI4s3oK5pNtJ7r613DkuNB
	AQfYz2/BPQTvbE1lQkJCMiz+haZjsifOEJoj7DeC93iKSkDzqy6g5sTXbkeGfz4xtCQU2NDf9OQ
	xnSYurWUlUYS69baRVghzNizHxHAmkZGKRzWWwn6gw=
X-Received: by 2002:a17:90a:e7c9:b0:39d:f615:725e with SMTP id 98e67ed59e1d1-39e54bc3a8emr3181270a91.13.1789710138647;
        Thu, 17 Sep 2026 22:42:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4ca1sm1662621c88.2.2026.09.17.22.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:42:18 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:12:13 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Link Mauve <linkmauve@linkmauve.fr>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: warning: unknown and unstable feature specified for
 `-Ctarget-feature`: `mma`
Message-ID: <aqzPCnhvogJ9XEJg@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <202609171549.xeqQabC6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609171549.xeqQabC6-lkp@intel.com>

On Thu, Sep 17, 2026 at 03:38:46PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   238650ef6c7c7cca08e032527329424c9fbd70e5
> commit: bc87cbdb952e9223616b839d64bdb4723aa2ed1d powerpc: Enable Rust for ppc64le
> date:   7 weeks ago
> config: powerpc64-randconfig-r2201-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> smatch: v0.5.0-9187-g5189e3fb
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: bc87cbdb952e ("powerpc: Enable Rust for ppc64le")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609171549.xeqQabC6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
>    |
>    = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
>    = help: consider filing a feature request
> --
> >> warning: unstable feature specified for `-Ctarget-feature`: `vsx`
>    |
>    = note: this feature is not stably supported; its behavior can change in the future
> --
> >> warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
>    |
>    = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
>    = help: consider filing a feature request
> --
> >> warning: unstable feature specified for `-Ctarget-feature`: `altivec`
>    |
>    = note: this feature is not stably supported; its behavior can change in the future
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is expected, the issue for the same is raised to rust-lang.

Regards,
Mukesh
