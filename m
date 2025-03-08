Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E717A2F1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741408933; cv=none; b=TglHdeTrQRBfFlGkyThyWUEycJf314YUTCMF2fl3Bxx/JbpH9LPPSrKPFhJXPbir3snKtBgerZXU20Y5efMreVPPEIRaazgbdVFzKWLcNgz2Jbr0uwv5kianq4YxHP/X5xrp5IBWR+0TgtJRHbaxV2REKj0Wjg7ucaBHaw64WjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741408933; c=relaxed/simple;
	bh=OXjgsMiYTm8QTA74KjSEOBYU9d2cszbp/4tG1GaVmjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjX7Mk2GySws/1Vumuv7xE7+XLHKpeMuiw6VaEgu9horFsbpQ1cOTWte9488srfn51ua2vHlrxcpNr39AA1YE0X4CzOEuc+dlI5xOm9Q7KcuTpyXSxqBVExwamp8SQBheKjBVb/cD146vNnnDMAW4OJau9l8s28+svA82bIJDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCQL1Hpi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCQL1Hpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EE3C4CEE0;
	Sat,  8 Mar 2025 04:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741408933;
	bh=OXjgsMiYTm8QTA74KjSEOBYU9d2cszbp/4tG1GaVmjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCQL1Hpi+WtGcq8UAINa94xi7mlOoGII0l0kzm5pcVHWgm8NSdsByQLaCSecWwVyV
	 ZtByq579V4jBF361DizH7Moe8EALz4uV6VxBcDhXR702DGxrSDFWcufys6KQEPBQNT
	 JKHhMpzlQwENQw0ioXHN9USWl6aBATxLdR8A3fTHKcupdwAUHGK+6RUJ5Jiu53zDYp
	 CzojKO3n50ZTzbvJ33pTuRn3c6E2/BTd8TWavyHMNYuOHBCFBPdZ4IgbMNNUkA3SvO
	 u6Ci+MU3FTCPkNP86uSrCnbRf7OVBYHV7ViWCcE8U4hmnuTlGN6vAU5Rg2CW4taDSs
	 jAtkAWv3OqlQQ==
Date: Fri, 7 Mar 2025 20:42:09 -0800
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 6391/9634] include/linux/ucopysize.h:47:25:
 error: call to '__bad_copy_to' declared with attribute error: copy
 destination size is too small
Message-ID: <202503072040.59EF3A390D@keescook>
References: <202503081120.jyUyb28m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503081120.jyUyb28m-lkp@intel.com>

On Sat, Mar 08, 2025 at 11:39:28AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0a2f889128969dab41861b6e40111aa03dc57014
> commit: 808aac63e2bdf9bae08485e072bf3d317a18acbf [6391/9634] uaccess: Introduce ucopysize.h
> config: i386-buildonly-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081120.jyUyb28m-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081120.jyUyb28m-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503081120.jyUyb28m-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 0a2f889128969dab41861b6e40111aa03dc57014 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/uaccess.h:10,
>                     from include/linux/sched/task.h:13,
>                     from include/linux/sched/signal.h:9,
>                     from include/linux/rcuwait.h:6,
>                     from include/linux/percpu-rwsem.h:7,
>                     from include/linux/fs.h:33,
>                     from drivers/misc/ntsync.c:11:
>    In function 'check_copy_size',
>        inlined from 'copy_from_user' at include/linux/uaccess.h:207:7,
>        inlined from 'setup_wait' at drivers/misc/ntsync.c:890:6:
> >> include/linux/ucopysize.h:47:25: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
>       47 |                         __bad_copy_to();
>          |                         ^~~~~~~~~~~~~~~

It looks like this is an old error that just changed because the name of
the header containing __bad_copy_to changed.

Regardless, I can't reproduce this with GCC 12.3 (Ubuntu). I'm getting a
build image for Debian 12 (GCC 12.2) built to see if there is a
difference...


-- 
Kees Cook
