Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5C14A4C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732782134; cv=none; b=i/CcbIwgeBgCYLA17PXRKj6dF4gFyumFNVv2HhGIMTGCTBJW/ghnY/OAyTRf4Lcf7iRzugSwvvlo5ZqYTKlnYRYT5b6bDCHwa1bY5sXdofyLVpIalNYBLog4Fx/Cu15XDYdjOBuwoARQQ139cnE0HiE+olbVrabqvnHjiMIFvw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732782134; c=relaxed/simple;
	bh=NuOehCl11U9UMXWKQDabPjToPUoRIYznpGN/GDMhyPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr/EjCPSwWKMgB0pNzw0rEvNfjl5rp95TLzV+3Xo8WJ02no9ypgcfxAgj3aV9y6D22lSfj8nT//AsBQTFtoCjJRtuHT1Hj5VLOJzFzqma08r0PxK2O2lBz9hA/Ij074eiYM0d0vXqFUK061pkA5WNUTNr6binTaWaYy1ZlSfryQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJXcq12g; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJXcq12g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732782132; x=1764318132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NuOehCl11U9UMXWKQDabPjToPUoRIYznpGN/GDMhyPc=;
  b=KJXcq12gb5EYGhxPCl/6G2icu5boHRvHOxEKWhm+GW7B88j98izykzh7
   /iipD6QPCFGhqjrhgUTqH9u7lLR4Mfs/yPFdfWNXVZa01GR6Iptrsw6pB
   c0IkyhNxL7y3mLJ7vZ7AHj+r3Js8miksQS/TpGeDwAmE1Kc5efXEbA6zQ
   IvoMsR3CZt0cf9gkNgYnnuQ6UDFzTPKdsC9VQgXxO/tq0ZqkCBMMsk+Kp
   lxDCbCx1DIJM0VEJTd5qvsQH6CDwMnI3YaIuQKJ9u6+Uc0BN2Rl53Ye50
   PobeEtEYMd04WjKQb06tsVl0ryKD/1tPnQtv84zAWN4m8lf4Va0/VwFPL
   w==;
X-CSE-ConnectionGUID: DbiUp7jxQjS1zLvvoml37w==
X-CSE-MsgGUID: byQqAWfsROWnGwy7vjLexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32941176"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="32941176"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 00:22:10 -0800
X-CSE-ConnectionGUID: b59iKsT/RqW+n7PXf0etHA==
X-CSE-MsgGUID: 24j4zudxT/WPcl+yM2RC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97261007"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 00:22:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGZmo-0009L1-27;
	Thu, 28 Nov 2024 08:22:06 +0000
Date: Thu, 28 Nov 2024 16:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
	dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h
 where needed
Message-ID: <202411281615.esoi7OGQ-lkp@intel.com>
References: <20241127095308.3149411-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127095308.3149411-1-jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master sailus-media-tree/streams sailus-media-tree/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/media-cec-include-linux-debugfs-h-and-linux-seq_file-h-where-needed/20241128-120741
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20241127095308.3149411-1-jani.nikula%40intel.com
patch subject: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h where needed
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241128/202411281615.esoi7OGQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281615.esoi7OGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281615.esoi7OGQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/cec/core/cec-pin-error-inj.c: In function 'cec_pin_show_cmd':
>> drivers/media/cec/core/cec-pin-error-inj.c:243:17: error: implicit declaration of function 'seq_puts' [-Wimplicit-function-declaration]
     243 |                 seq_puts(sf, "any,");
         |                 ^~~~~~~~
>> drivers/media/cec/core/cec-pin-error-inj.c:245:17: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Wimplicit-function-declaration]
     245 |                 seq_printf(sf, "0x%02x,", cmd);
         |                 ^~~~~~~~~~
         |                 bstr_printf


vim +/seq_puts +243 drivers/media/cec/core/cec-pin-error-inj.c

22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  239  
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  240  static void cec_pin_show_cmd(struct seq_file *sf, u32 cmd, u8 mode)
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  241  {
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  242  	if (cmd == CEC_ERROR_INJ_OP_ANY)
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31 @243  		seq_puts(sf, "any,");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  244  	else
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31 @245  		seq_printf(sf, "0x%02x,", cmd);
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  246  	switch (mode) {
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  247  	case CEC_ERROR_INJ_MODE_ONCE:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  248  		seq_puts(sf, "once ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  249  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  250  	case CEC_ERROR_INJ_MODE_ALWAYS:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  251  		seq_puts(sf, "always ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  252  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  253  	case CEC_ERROR_INJ_MODE_TOGGLE:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  254  		seq_puts(sf, "toggle ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  255  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  256  	default:
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  257  		seq_puts(sf, "off ");
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  258  		break;
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  259  	}
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  260  }
22712b389e40ae drivers/media/cec/cec-pin-error-inj.c Hans Verkuil 2017-10-31  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
