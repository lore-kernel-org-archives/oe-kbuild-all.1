Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278C1A707A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737234969; cv=none; b=PZisgDeQZNBNFFgXOSif3mxQSFduRbKS4qK/NJtq+vkeZc8tHs29j+EnP2v0XDJK0B7c6IOB+nJme0otU2JbrZcPcWWifD++XS0lGNHk6cit4N81mXIIz9spfU1jrHQqrGaYerrnkV/3yJ69kmwtfXJDQjePL5mzZ/0lIZiypr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737234969; c=relaxed/simple;
	bh=dr4YDSDNJkmVcet6NYSK0BD7RdBaTbEDMGXHZHUsXg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuB2RujjUqdGCmdFb8dki5YBvoYp5dtIdTHFA9z/IsU4afy9Q5Twj5K/di4FMPaCE3lKp/Yoh20a/svfLpn6OJo/EbpePq26ii4r5bY+P+ALk+2TzgACfrAbH0gPIVz98MF4OtI++N2nYCeLESeZg4wyaU6t+NCWtfJLEHDZTVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acJPPMnc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acJPPMnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737234965; x=1768770965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dr4YDSDNJkmVcet6NYSK0BD7RdBaTbEDMGXHZHUsXg4=;
  b=acJPPMnciJ8vTtTdP77Z3Q5Rib7yhhncG2j6X81r+qEQXekn36cShMgd
   8AdFA+Ui7S82HKXnybg7E9JJp8vLeeA/py71RXoN4MRz/PBGt3HRDpgYc
   pvUcz/vSzsNPWrIACRVI6Hc/NdLl8cJ2aqI0BGTK9AI1SpI9J56ziNRle
   8YxA+FOMRdJEGIgHQVzxlKpgzUoCCIMvgXcpTozJtv7EDem0PjgN4msO0
   BIiFvsV7Q+zEUWHWYjA+uOWfcpRu77SoXGRo2F5jJOX7UVGhnVFZQPNUj
   Xx/2idpL4iZOPmntZAO35i7adXQO7rY8qSKLWbHU0tbcR8UwXevfabXkN
   A==;
X-CSE-ConnectionGUID: OwZZhVEtRmarKGbFzRmuQQ==
X-CSE-MsgGUID: GV8pFPRRRVytG6F6i/RfbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37881551"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37881551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 13:16:04 -0800
X-CSE-ConnectionGUID: mGG/A8y1SoOPizn9o1ICZw==
X-CSE-MsgGUID: NM2HquAlTOiEVlfHKKi71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="136952119"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 13:16:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZGAi-000Uop-1Z;
	Sat, 18 Jan 2025 21:16:00 +0000
Date: Sun, 19 Jan 2025 05:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 50/51] sound/usb/fcp.c:889:22: error:
 assignment to 'long int (*)(struct snd_hwdep *, char *, long int,  loff_t
 *)' {aka 'long int (*)(struct snd_hwdep *, char *, long int,  long long int
 *)'} from incompatible pointer type 'ssize_t (*)(struct snd_hwdep *, char
 ...
Message-ID: <202501190536.A2CiOP0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   0ce204d3af3beca1825018e9ca128635ccc8aa85
commit: 46757a3e7d50dac923888e7fbe68377736f13c70 [50/51] ALSA: FCP: Add Focusrite Control Protocol driver
config: i386-buildonly-randconfig-004-20250119 (https://download.01.org/0day-ci/archive/20250119/202501190536.A2CiOP0a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190536.A2CiOP0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190536.A2CiOP0a-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/usb/fcp.c: In function 'fcp_hwdep_init':
>> sound/usb/fcp.c:889:22: error: assignment to 'long int (*)(struct snd_hwdep *, char *, long int,  loff_t *)' {aka 'long int (*)(struct snd_hwdep *, char *, long int,  long long int *)'} from incompatible pointer type 'ssize_t (*)(struct snd_hwdep *, char *, ssize_t,  loff_t *)' {aka 'int (*)(struct snd_hwdep *, char *, int,  long long int *)'} [-Werror=incompatible-pointer-types]
     889 |         hw->ops.read = fcp_hwdep_read;
         |                      ^
   cc1: some warnings being treated as errors


vim +889 sound/usb/fcp.c

   874	
   875	static int fcp_hwdep_init(struct usb_mixer_interface *mixer)
   876	{
   877		struct snd_hwdep *hw;
   878		int err;
   879	
   880		err = snd_hwdep_new(mixer->chip->card, "Focusrite Control", 0, &hw);
   881		if (err < 0)
   882			return err;
   883	
   884		hw->private_data = mixer;
   885		hw->exclusive = 1;
   886		hw->ops.open = fcp_hwdep_open;
   887		hw->ops.ioctl = fcp_hwdep_ioctl;
   888		hw->ops.ioctl_compat = fcp_hwdep_ioctl;
 > 889		hw->ops.read = fcp_hwdep_read;
   890		hw->ops.poll = fcp_hwdep_poll;
   891		hw->ops.release = fcp_hwdep_release;
   892	
   893		return 0;
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
