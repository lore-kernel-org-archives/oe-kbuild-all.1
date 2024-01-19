Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265F52F94
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676949; cv=none; b=Ae09Kyrvf9gCKzHetHaCYiDm4d+GW5bKumo8Vn+fiDyeEtV5DUTftdoJo+h9GQGfnU1pSiYow1Lzb04LJOpWKtH0eYpS+HnBLEFAaqTsomsDNKeLNN6VxXJaZazHRgeDWTxOlZ2wQ5xoQ7q1fgvUufUIfqxXhJIbY2rh/5hOAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676949; c=relaxed/simple;
	bh=h5qGiMy+3ZEgOpzyuoAtOw3UtNJID6WptMjXvM/BHp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d5tAzbb8BFY0h+hfdiMKB7p3KZW5Rdz/CFZGUCuqPPNP4en9uQuglhY+tFDwt2Tb3UHy3fgqscOsFXv2JsQD3lvM+SQoxlVXj+W2/6gNL5tSV5yqu5rFuOSI7nH6o5qQqaNkig8oD4pHlLqQpQHiE6WPCWUO4+eiGcg+0DJkrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcsiyJs+; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcsiyJs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705676947; x=1737212947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5qGiMy+3ZEgOpzyuoAtOw3UtNJID6WptMjXvM/BHp4=;
  b=jcsiyJs+XuWrm09jhP2vgkUEJcDUSCv+eehPa3Yq3LKFp0lH9oo/HBiI
   VSsR4eUfL7Oi1FlAg0X6ge0ylwFd7GRFYTS2gSPpTRNn4Bk4fiimmwyWb
   u8zzE0ZsPvf7JKS31VyGvEE8SK+ihazrBSzynHXMMDuB5oYMYPw5cRrg5
   OwAnnYHB+/BG77tKM5snsMwp1+QYEchILaQ9F9XggBcusD6Ms1sA+ybrL
   A61YfX3yhIPdarZGSnJouNetjndLuPzUh0vyb9qzx8ivrs1fVxQliCe3z
   hm3+/Hz9DwFWdUSbei64rcqtB2Ret9Hfor+AaFYpZVPMDE4UhOBAo9hTV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="399632216"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="399632216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 07:09:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="908348295"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="908348295"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2024 07:09:05 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQqUQ-0004A8-1X;
	Fri, 19 Jan 2024 15:09:02 +0000
Date: Fri, 19 Jan 2024 23:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 21/27552]
 drivers/usb/gadget/function/f_audio_source.c:1028: undefined reference to
 `create_function_device'
Message-ID: <202401192220.Ze6qX2PT-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   da99db444bac054cb5c03909ded5f48fb5dbb613
commit: 1983276ceb62da2dda057c83fe676916b51fe939 [21/27552] ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
config: i386-randconfig-053-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192220.Ze6qX2PT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192220.Ze6qX2PT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192220.Ze6qX2PT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/rwsem.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/rwsem.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
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
