Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277081079A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692982324; x=1724518324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JqDm2o4U8gKH2chq4LTSFXCqp8Qdx/KvCMMcTttnZ0=;
  b=Qdq3USwWO2UuKc1Oytf3l47WoREUAzQ3AO143Bl2ue0zoll1yRncGjSs
   Thc/Z7gFK87scjfDCyKZl4YcrUrztJ0EBjgxEvoivUrwYfgVttA5Q4oNN
   QgLauiD3rSC683banTg+9RDqnCDQ/LWpR/4KlPRu7N9JDKSPs6cZ0VB8B
   O9/E6Cwc/uCRTEo/Bcc5KjU3ucS8RGDJGCpekKo4tJ4p7huhLadaG8h1J
   Mr5eCM6bnKB2NEj/Y2t/5E7wA/97+krRSoo3RzsDVY3F2eJ42yLkCnBS4
   gNE79C/74+Lk0uOz0Y9sH9Y/BJBLzkaDlMRwq3fVyvZXomg5s30/Px3O6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377493166"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="377493166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 09:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772542643"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="772542643"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 09:51:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZa2I-0003oh-1G;
	Fri, 25 Aug 2023 16:51:51 +0000
Date: Sat, 26 Aug 2023 00:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 21/29778]
 drivers/usb/gadget/function/f_audio_source.c:1028: undefined reference to
 `create_function_device'
Message-ID: <202308260031.kZrLDM25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   096e6c86b6160c7f99a75da296e6147b47bc8a43
commit: 1983276ceb62da2dda057c83fe676916b51fe939 [21/29778] ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
config: i386-randconfig-004-20230824 (https://download.01.org/0day-ci/archive/20230826/202308260031.kZrLDM25-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260031.kZrLDM25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260031.kZrLDM25-lkp@intel.com/

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
