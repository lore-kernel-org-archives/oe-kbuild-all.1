Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75C1E526
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715441236; cv=none; b=ki7EYXTD4vAH0wlrXjq6xIpkQzlTKdYSLIUsLgYf2xEtl4CJjE2DiVVv+5UvxRXnMGPjH3plczYSmQXFS3Ps73A2U9lNXe7FsXO6DRVKRgI5UqHpZOeMnWE9V4CI3BtEqMjZbRnNG+IM79fLf6E1nORc54LTqrITLUiixTxoG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715441236; c=relaxed/simple;
	bh=R0OoffFMucGiY4+SWme3GUbZF3fRExKb08z4EPqSX4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbeWJvMF8jELsSjKsA+IT/UshYHt67Y1IRU75Cdd9TtH0iwtUKsRHXRvTN+DHAb4ngxJxWit2LXm3lrzOlkROcaQsfYSExRxZPrngFLt1W1yBtN6WVS32LwPy7sVG3pZ8ErM+uD+qE4+ScOwWRyUcgyue2HRwPy0ond1QLdGFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWotJswD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWotJswD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715441234; x=1746977234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0OoffFMucGiY4+SWme3GUbZF3fRExKb08z4EPqSX4I=;
  b=lWotJswDr0ocnW64JB10v4wzuu4U776RiLKz5XYyha9cdq3Tcy7RbU6N
   rqfHF+S4VJPsrVTXmurzoTBf0/C+S1d7pLA3ohkWp1TLNfRpV185pDtoM
   G5BH3JAiLX5I2XZHtepDzPxh/ZBCTGsGtYy7aWTR5zGQ3iX/ugil46ZCp
   bjRtoQg9CWyC6x5WrZaDl4L+KZHyGJb1wXR4DmC2y8HqQXB6FTMdaGl/J
   XhXNaBLXjZ3cMQaAw7nVgXYkrCTFpm/n65OwBwkNQIIFY4ASy3e//WvWc
   2jMUEBtIKUhis/xX/yHJnV3N7ZttlfCeDS+wqfVpx4ZEBE14dMSmQyyw1
   w==;
X-CSE-ConnectionGUID: ytZfBba3R7Sm7o5z3LZC+g==
X-CSE-MsgGUID: rxQrT5NGS+ymJdJLhQNqIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11644757"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="11644757"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 08:27:13 -0700
X-CSE-ConnectionGUID: JZRMe+sXSduM9YhdOQuWbA==
X-CSE-MsgGUID: WXmG4JNxRw6wUSEJ2kgSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="60752876"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 May 2024 08:27:12 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5ocv-0007YB-2o;
	Sat, 11 May 2024 15:27:09 +0000
Date: Sat, 11 May 2024 23:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [geoffreybennett-scarlett-gen2:scarlett2 1/1]
 sound/usb/mixer_scarlett2.c:7962 scarlett2_update_spdif_mode() warn: always
 true condition '(*mode_values != -1) => (0-255 != (-1))'
Message-ID: <202405112311.pOVg45tK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/geoffreybennett/scarlett-gen2.git scarlett2
head:   480eafc2d57158b29e8e5efa5b1ac8b5e5a01af8
commit: 480eafc2d57158b29e8e5efa5b1ac8b5e5a01af8 [1/1] ALSA: scarlett2: Add S/PDIF source selection controls
config: i386-randconfig-141-20240511 (https://download.01.org/0day-ci/archive/20240511/202405112311.pOVg45tK-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405112311.pOVg45tK-lkp@intel.com/

New smatch warnings:
sound/usb/mixer_scarlett2.c:7962 scarlett2_update_spdif_mode() warn: always true condition '(*mode_values != -1) => (0-255 != (-1))'
sound/usb/mixer_scarlett2.c:7962 scarlett2_update_spdif_mode() warn: always true condition '(*mode_values != -1) => (0-255 != (-1))'
sound/usb/mixer_scarlett2.c:8016 scarlett2_spdif_mode_ctl_put() warn: impossible condition '(private->info->spdif_mode_values[i] == -1) => (0-255 == (-1))'

Old smatch warnings:
sound/usb/mixer_scarlett2.c:9224 scarlett2_ioctl_select_flash_segment() warn: potential spectre issue 'private->flash_segment_nums' [r] (local cap)
sound/usb/mixer_scarlett2.c:9225 scarlett2_ioctl_select_flash_segment() warn: possible spectre second half.  'segment_num'

vim +7962 sound/usb/mixer_scarlett2.c

  7944	
  7945	static int scarlett2_update_spdif_mode(struct usb_mixer_interface *mixer)
  7946	{
  7947		struct scarlett2_data *private = mixer->private_data;
  7948		int err, i;
  7949		u8 mode;
  7950		const u8 *mode_values = private->info->spdif_mode_values;
  7951	
  7952		if (!private->info->spdif_mode_control_name)
  7953			return 0;
  7954	
  7955		err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_SPDIF_MODE,
  7956					       1, &mode);
  7957		if (err < 0)
  7958			return err;
  7959	
  7960		private->spdif_mode = 0;
  7961	
> 7962		for (i = 0; *mode_values != -1; i++, mode_values++)
  7963			if (*mode_values == mode) {
  7964				private->spdif_mode = i;
  7965				break;
  7966			}
  7967	
  7968		return 0;
  7969	}
  7970	
  7971	static int scarlett2_spdif_mode_ctl_info(struct snd_kcontrol *kctl,
  7972						   struct snd_ctl_elem_info *uinfo)
  7973	{
  7974		struct usb_mixer_elem_info *elem = kctl->private_data;
  7975		struct scarlett2_data *private = elem->head.mixer->private_data;
  7976		const char * const *mode_texts = private->info->spdif_mode_texts;
  7977		int count = 0;
  7978	
  7979		while (*mode_texts++)
  7980			count++;
  7981	
  7982		return snd_ctl_enum_info(uinfo, 1, count,
  7983					 private->info->spdif_mode_texts);
  7984	}
  7985	
  7986	static int scarlett2_spdif_mode_ctl_get(struct snd_kcontrol *kctl,
  7987						  struct snd_ctl_elem_value *ucontrol)
  7988	{
  7989		struct usb_mixer_elem_info *elem = kctl->private_data;
  7990		struct scarlett2_data *private = elem->head.mixer->private_data;
  7991	
  7992		ucontrol->value.enumerated.item[0] = private->spdif_mode;
  7993		return 0;
  7994	}
  7995	
  7996	static int scarlett2_spdif_mode_ctl_put(struct snd_kcontrol *kctl,
  7997						  struct snd_ctl_elem_value *ucontrol)
  7998	{
  7999		struct usb_mixer_elem_info *elem = kctl->private_data;
  8000		struct usb_mixer_interface *mixer = elem->head.mixer;
  8001		struct scarlett2_data *private = mixer->private_data;
  8002		int oval, val, err = 0;
  8003		int i;
  8004	
  8005		mutex_lock(&private->data_mutex);
  8006	
  8007		oval = private->spdif_mode;
  8008		val = ucontrol->value.enumerated.item[0];
  8009	
  8010		if (val < 0) {
  8011			err = -EINVAL;
  8012			goto unlock;
  8013		}
  8014	
  8015		for (i = 0; i <= val; i++)
> 8016			if (private->info->spdif_mode_values[i] == -1) {
  8017				err = -EINVAL;
  8018				goto unlock;
  8019			}
  8020	
  8021		if (oval == val)
  8022			goto unlock;
  8023	
  8024		private->spdif_mode = val;
  8025	
  8026		err = scarlett2_usb_set_config(
  8027			mixer, SCARLETT2_CONFIG_SPDIF_MODE, 0,
  8028			private->info->spdif_mode_values[val]);
  8029		if (!err)
  8030			err = 1;
  8031	
  8032	unlock:
  8033		mutex_unlock(&private->data_mutex);
  8034		return err;
  8035	}
  8036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
