Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C517FE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916062; cv=none; b=Boxk5tS19hys3xl5UNtvNGREWUnD2huuNVxDNU1w+Jm9YErbsr0NAL6NbZRj25T4nyZrx5+1xSnyz7WMQ8Dp3HZaMaN3D1rEcXyfgf9MqvYQ+JgxBit3LI+BpS2EGx5cg0qn8SEOYqaKFPoqYi5hCZxcftq/tNOIN202ygSkFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916062; c=relaxed/simple;
	bh=q3MwP8lDRIV7Merl/FSP4K34hT7XYz8ClgQ6hZx3vZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovkV2NIrXij9+MQpoUY0ztefVY475Efl3K11bnjMrH0vS4NvzmUDHmFY+4cFYfTrkRV6woOkwedoNMvC97gf9q6RjndJZSvThzu7uB7BoLZGZAXT+irVt+JFZRnqznWvNbgq8mJI891vXphqyeYO/E34UDiBPTCdo2RtUZgD4Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arg6ocPa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arg6ocPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735916060; x=1767452060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q3MwP8lDRIV7Merl/FSP4K34hT7XYz8ClgQ6hZx3vZ8=;
  b=arg6ocPaY/RABkzs4wSaTGe+YpFUZKCBWCgDA+4LpGtqI5XdTn62+I2j
   p6AsM6TE7lfQlEt0o16Il53O3J6Z3Os26WWqD8oyLejgzBXdotbDpRLUE
   qhKxOsvJCJC8+FZdKARqgs/ifiyqY9lrfUPFXcJNpLGCJ9kqesnNele8V
   5nw3p1rgLbXA5CWId7aO8dcLDX/e4xgznWXebapjsyHFOggt0XpC2XpAw
   OjubdYIfHS+rPOUT5cp33ydz+4MXw7gn9CgTvVcq6yjyp0hpNngRNHO1n
   WxzB9i2DlOXhpKs15xV+dlEnLJZU9T/G3r4RYrXefjpioK5R9mOT8vLQ3
   A==;
X-CSE-ConnectionGUID: ffmzumJQRuiR/zfmTPUCMQ==
X-CSE-MsgGUID: CRKxT0ilQMCiNXy62inBDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="23765263"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23765263"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:54:20 -0800
X-CSE-ConnectionGUID: RjYE0bcsTzWeeF4YNBAToA==
X-CSE-MsgGUID: 0nVt+0E4TOuC4jZKLcHVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101997862"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2025 06:54:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTj44-0009rP-1k;
	Fri, 03 Jan 2025 14:54:16 +0000
Date: Fri, 3 Jan 2025 22:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/greybus/audio_topology.c:1172:56: warning: '%s'
 directive output may be truncated writing up to 31 bytes into a region of
 size between 17 and 27
Message-ID: <202501032214.HtGtSCgV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: c9a57eddb235d53b0a8b9d740e454ef466086fc8 staging: greybus: audio: Enable GB codec, audio module compilation.
date:   4 years, 5 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250103/202501032214.HtGtSCgV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032214.HtGtSCgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032214.HtGtSCgV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_topology.c: In function 'find_gb_module':
   drivers/staging/greybus/audio_topology.c:31:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      31 |         int dev_id, ret;
         |                     ^~~
   drivers/staging/greybus/audio_topology.c: In function 'gbcodec_mixer_dapm_ctl_get':
   drivers/staging/greybus/audio_topology.c:380:40: warning: variable 'info' set but not used [-Wunused-but-set-variable]
     380 |         struct gb_audio_ctl_elem_info *info;
         |                                        ^~~~
   drivers/staging/greybus/audio_topology.c: In function 'gbaudio_tplg_process_kcontrols':
>> drivers/staging/greybus/audio_topology.c:1172:56: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
    1172 |                 snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
         |                                                        ^~
    1173 |                          temp_name);
         |                          ~~~~~~~~~                      
   drivers/staging/greybus/audio_topology.c:1172:17: note: 'snprintf' output between 6 and 47 bytes into a destination of size 32
    1172 |                 snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1173 |                          temp_name);
         |                          ~~~~~~~~~~
   drivers/staging/greybus/audio_topology.c: In function 'gbaudio_tplg_create_widget':
   drivers/staging/greybus/audio_topology.c:1050:45: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
    1050 |         snprintf(w->name, NAME_SIZE, "GB %d %s", module->dev_id, temp_name);
         |                                             ^~                   ~~~~~~~~~
   drivers/staging/greybus/audio_topology.c:1050:9: note: 'snprintf' output between 6 and 47 bytes into a destination of size 32
    1050 |         snprintf(w->name, NAME_SIZE, "GB %d %s", module->dev_id, temp_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1172 drivers/staging/greybus/audio_topology.c

6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1137  
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1138  static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1139  					  struct gb_audio_control *controls)
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1140  {
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1141  	int i, csize, ret;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1142  	struct snd_kcontrol_new *dapm_kctls;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1143  	struct gb_audio_control *curr;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1144  	struct gbaudio_control *control, *_control;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1145  	size_t size;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1146  	char temp_name[NAME_SIZE];
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1147  
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1148  	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1149  	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1150  	if (!dapm_kctls)
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1151  		return -ENOMEM;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1152  
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1153  	curr = controls;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1154  	for (i = 0; i < module->num_controls; i++) {
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1155  		ret = gbaudio_tplg_create_kcontrol(module, &dapm_kctls[i],
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1156  						   curr);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1157  		if (ret) {
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1158  			dev_err(module->dev, "%s:%d type not supported\n",
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1159  				curr->name, curr->iface);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1160  			goto error;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1161  		}
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1162  		control = devm_kzalloc(module->dev, sizeof(struct
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1163  							   gbaudio_control),
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1164  				      GFP_KERNEL);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1165  		if (!control) {
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1166  			ret = -ENOMEM;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1167  			goto error;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1168  		}
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1169  		control->id = curr->id;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1170  		/* Prefix dev_id to widget_name */
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1171  		strlcpy(temp_name, curr->name, NAME_SIZE);
6dd67645f22cfe Vaibhav Agarwal 2016-03-29 @1172  		snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1173  			 temp_name);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1174  		control->name = curr->name;
e65579e335da0a Vaibhav Agarwal 2016-06-30  1175  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
e65579e335da0a Vaibhav Agarwal 2016-06-30  1176  			struct gb_audio_enumerated *gbenum =
e65579e335da0a Vaibhav Agarwal 2016-06-30  1177  				&curr->info.value.enumerated;
e65579e335da0a Vaibhav Agarwal 2016-06-30  1178  
e65579e335da0a Vaibhav Agarwal 2016-06-30  1179  			csize = offsetof(struct gb_audio_control, info);
e65579e335da0a Vaibhav Agarwal 2016-06-30  1180  			csize += offsetof(struct gb_audio_ctl_elem_info, value);
e65579e335da0a Vaibhav Agarwal 2016-06-30  1181  			csize += offsetof(struct gb_audio_enumerated, names);
055fb9ce92d59d Vaibhav Agarwal 2017-01-18  1182  			csize += le16_to_cpu(gbenum->names_length);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1183  			control->texts = (const char * const *)
e65579e335da0a Vaibhav Agarwal 2016-06-30  1184  				gb_generate_enum_strings(module, gbenum);
055fb9ce92d59d Vaibhav Agarwal 2017-01-18  1185  			control->items = le32_to_cpu(gbenum->items);
02ae32f754a6cb Chase Metzger   2016-10-06  1186  		} else {
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1187  			csize = sizeof(struct gb_audio_control);
02ae32f754a6cb Chase Metzger   2016-10-06  1188  		}
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1189  
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1190  		list_add(&control->list, &module->ctl_list);
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1191  		dev_dbg(module->dev, "%d:%s created of type %d\n", curr->id,
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1192  			curr->name, curr->info.type);
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1193  		curr = (void *)curr + csize;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1194  	}
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1195  	module->controls = dapm_kctls;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1196  
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1197  	return 0;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1198  error:
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1199  	list_for_each_entry_safe(control, _control, &module->ctl_list,
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1200  				 list) {
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1201  		list_del(&control->list);
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1202  		devm_kfree(module->dev, control);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1203  	}
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1204  	devm_kfree(module->dev, dapm_kctls);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1205  	return ret;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1206  }
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1207  

:::::: The code at line 1172 was first introduced by commit
:::::: 6dd67645f22cfeb55a32e9a08c92deb297d06935 greybus: audio: Use single codec driver registration

:::::: TO: Vaibhav Agarwal <vaibhav.agarwal@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
