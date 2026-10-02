Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7747F2C2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935978; cv=none; b=psqzLD2TXOnO9JzmnZkjXsHaGhdTrq+oPo/g5VFgAfeomaQogOWhDQTPfplj99VE32qsx3ntLcu4VwYSiEo0+6UGonHkpIbzKbEGclPCXNpV8PvqmUlvICZKjuQYYLHiOk1Ot2sXLVQ3IeOO2Yyub9Kk6AuvAIb+LzelEBfyZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935978; c=relaxed/simple;
	bh=l8J94yKtN0hal2lIolQFMyIxvhVf5/BkTq8I8UFu+2c=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRmjit8SCcB+VC0QOzEAmvzImYfPv0EdBz4BAO4uxMDFUHxccD8kiq2aTKdmU8bkvL+u3ud+Es4nt9KcuJDHv1UvNClQmr/4Saak7uYSy2tg/meXsYBaOb5eYQpm2lCkP7to2KuCMK8eDgqwi1LvTfdHuasGZ97EKJKMpbY6rko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4+17jut; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4+17jut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790935976; x=1822471976;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=l8J94yKtN0hal2lIolQFMyIxvhVf5/BkTq8I8UFu+2c=;
  b=U4+17jutQ2PIDUsO/WqIumfQpNgIKXB+pO20vyPGpb6c+r+A8LpoUhML
   /DUHBepemUO9+YJLkX6uINltrsGll6Bfj8+go+HqQFG/7U2EKCgg9UjzZ
   cxrXWUiCElwsEqKlB+JnkF3l8r0MCP2chCoKnHI58Uj9PpurVelMduJ/J
   t0LErLXOqdysMbVomJVfXTc0b4OOysld/5dsElVlNmR20zyQca6i5ACQ1
   KEt0tt+DZ6Cg3y+PrD31m8wlyyVSRIoAHwQ15C8/S1/okKUGUxCx7Ev6h
   o8i+9P01b12c3R0anFJOznz7gMW5c2nTEZ6xx2mJPB2lb4/1qn/WY1Ei9
   g==;
X-CSE-ConnectionGUID: iDUMzTjzSei/6B4wLo3C5A==
X-CSE-MsgGUID: 9D/+GvCqT4SQWyxDq26eFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102375735"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102375735"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:12:55 -0700
X-CSE-ConnectionGUID: UiRKVHRoTSCOI8NbxFCJaA==
X-CSE-MsgGUID: 9IzIPFWoR4OSTjt7a61H0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275771043"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 03:12:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCaG4-00000000SvM-3ibf
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 10:12:52 +0000
Date: Fri, 2 Oct 2026 18:11:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: staging: greybus: audio: Fix no terminating newline in sysfs emit
Message-ID: <202610021803.2F2RQ73w-lkp@intel.com>
References: <202610021803.2F2RQ73w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610021803.2F2RQ73w-lkp@intel.com>

Hi Raiden,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Raiden-Horner/staging-greybus-audio-Fix-no-terminating-newline-in-sysfs-emit/20261001-111458
base:   
patch link:    https://lore.kernel.org/r/202610021803.2F2RQ73w-lkp%40intel.com
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20261002/202610021803.2F2RQ73w-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021803.2F2RQ73w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021803.2F2RQ73w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_manager_module.c: In function 'send_add_uevent':
>> drivers/staging/greybus/audio_manager_module.c:180:53: warning: passing argument 3 of 'kobject_uevent_env' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     180 |         kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
         |                                                     ^~~~
   In file included from drivers/staging/greybus/audio_manager.h:11,
                    from drivers/staging/greybus/audio_manager_module.c:10:
   include/linux/kobject.h:283:31: note: expected 'char **' but argument is of type 'char * const*'
     283 |                         char *envp[]);
         |                         ~~~~~~^~~~~~


vim +180 drivers/staging/greybus/audio_manager_module.c

8db00736d365b7 Svetlin Ankov    2016-01-13  151  
8db00736d365b7 Svetlin Ankov    2016-01-13  152  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov    2016-01-13  153  {
8db00736d365b7 Svetlin Ankov    2016-01-13  154  	char name_string[128];
8db00736d365b7 Svetlin Ankov    2016-01-13  155  	char vid_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  156  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  157  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  158  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  159  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  160  
757f49b7d08da4 Raiden Horner    2026-10-01  161  	char * const envp[] = {
8db00736d365b7 Svetlin Ankov    2016-01-13  162  		name_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  163  		vid_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  164  		pid_string,
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  165  		intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  166  		ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  167  		op_devices_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  168  		NULL
8db00736d365b7 Svetlin Ankov    2016-01-13  169  	};
8db00736d365b7 Svetlin Ankov    2016-01-13  170  
8db00736d365b7 Svetlin Ankov    2016-01-13  171  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov    2016-01-13  172  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov    2016-01-13  173  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  174  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  175  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  176  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  177  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  178  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov    2016-01-13  179  
8db00736d365b7 Svetlin Ankov    2016-01-13 @180  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov    2016-01-13  181  }
8db00736d365b7 Svetlin Ankov    2016-01-13  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
