Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9F717996
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161424; cv=none; b=NXyCsr3MTBKz3dNxkOkhQl6OWub+QWoXbK8BopwpgMabzfK3uCMAZWtmWAw7V+QSgKKwMSSkm6Aya32rUxKMj462s8ksR2nuhVbRVM+ex1NLrGueq0LjrBd3dSqFbXqcs2VFJGvACWLjuuS3zdvsBnkJY2FTUfKBOweNg4T+Qok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161424; c=relaxed/simple;
	bh=Q58bhlUA0qtXl5WBBzcDTZ+8w7DSzcDpUC1m7x9WUO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+hphOyakNQMNgxrnvyjNCTs34s2y0r6nSceFYQywm9/F30vlWTfyzYsAz2M+LaLqTOVCIHCf2PQiEV9ok6tGQHDAxtrczie2hCdzeeaFPtI/rIoZWmQz9M309+uD9JDW1MLYeSibaC0UOngXzrkS30xMLsuqxb5lPkndwfir9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqdYGzJx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqdYGzJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730161422; x=1761697422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q58bhlUA0qtXl5WBBzcDTZ+8w7DSzcDpUC1m7x9WUO4=;
  b=FqdYGzJx5LWECndcpAvrR5rj+PRs+95vFIPzLfEWrUM63L9oKdmV0wzA
   VPnhpb63ytm3qUtMSMySyDID/CzkPVSXNR/54JIPrXNHBB5i8kH/+qI9Q
   HdVjHnxlvlu20gHF2e8dKh7kiHLlBf+b5CkSzamhJ3tmxNrxH4PaPkUde
   qUUZEFcuYLxuZPQwKmPyEZvHH3+jZg+u4CQZMghLjjBigesujJm2x3IiF
   LYZ2On2/meN+a8Lyb9y3sKKs+n6JicdRlQtWdgzV0nXR2ESAsZ73prCZS
   zkPFpcWoW/s0BjA1YXxYHId+fsUTuuMmCMG4FvNYDSAUOLw8XgcXnMp3J
   A==;
X-CSE-ConnectionGUID: qepEoxBNR/CyExvVc2GYfg==
X-CSE-MsgGUID: uc1GAb/cRqGe4OvDEaEclw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29684342"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29684342"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 17:23:35 -0700
X-CSE-ConnectionGUID: +f1FGEJoQ9y0YDt5IF9Xdg==
X-CSE-MsgGUID: 1QSToqgATZOewWpVeT+Mgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81880923"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2024 17:23:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5a1C-000d3W-2U;
	Tue, 29 Oct 2024 00:23:30 +0000
Date: Tue, 29 Oct 2024 08:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Lockwood <lockwood@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	Alistair Strachan <astrachan@google.com>
Subject: drivers/usb/gadget/function/f_audio_source.c:1028: undefined
 reference to `create_function_device'
Message-ID: <202410290817.5sq6wpNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 1983276ceb62da2dda057c83fe676916b51fe939 ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
date:   5 years ago
config: x86_64-randconfig-071-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290817.5sq6wpNT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290817.5sq6wpNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290817.5sq6wpNT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/usb/gadget/function/f_audio_source.o: in function `audio_source_alloc_inst':
>> drivers/usb/gadget/function/f_audio_source.c:1028: undefined reference to `create_function_device'


vim +1028 drivers/usb/gadget/function/f_audio_source.c

  1002	
  1003	static struct usb_function_instance *audio_source_alloc_inst(void)
  1004	{
  1005		struct audio_source_instance *fi_audio;
  1006		struct device_attribute **attrs;
  1007		struct device_attribute *attr;
  1008		struct device *dev;
  1009		void *err_ptr;
  1010		int err = 0;
  1011	
  1012		fi_audio = kzalloc(sizeof(*fi_audio), GFP_KERNEL);
  1013		if (!fi_audio)
  1014			return ERR_PTR(-ENOMEM);
  1015	
  1016		fi_audio->func_inst.set_inst_name = audio_source_set_inst_name;
  1017		fi_audio->func_inst.free_func_inst = audio_source_free_inst;
  1018	
  1019		fi_audio->config = kzalloc(sizeof(struct audio_source_config),
  1020								GFP_KERNEL);
  1021		if (!fi_audio->config) {
  1022			err_ptr = ERR_PTR(-ENOMEM);
  1023			goto fail_audio;
  1024		}
  1025	
  1026		config_group_init_type_name(&fi_audio->func_inst.group, "",
  1027							&audio_source_func_type);
> 1028		dev = create_function_device("f_audio_source");
  1029	
  1030		if (IS_ERR(dev)) {
  1031			err_ptr = dev;
  1032			goto fail_audio_config;
  1033		}
  1034	
  1035		fi_audio->config->card = -1;
  1036		fi_audio->config->device = -1;
  1037		fi_audio->audio_device = dev;
  1038	
  1039		attrs = audio_source_function_attributes;
  1040		if (attrs) {
  1041			while ((attr = *attrs++) && !err)
  1042				err = device_create_file(dev, attr);
  1043			if (err) {
  1044				err_ptr = ERR_PTR(-EINVAL);
  1045				goto fail_device;
  1046			}
  1047		}
  1048	
  1049		dev_set_drvdata(dev, fi_audio);
  1050		_audio_dev.config = fi_audio->config;
  1051	
  1052		return  &fi_audio->func_inst;
  1053	
  1054	fail_device:
  1055		device_destroy(dev->class, dev->devt);
  1056	fail_audio_config:
  1057		kfree(fi_audio->config);
  1058	fail_audio:
  1059		kfree(fi_audio);
  1060		return err_ptr;
  1061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
