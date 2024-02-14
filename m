Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602BBA22
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707879429; cv=none; b=H76V93Z4OeGJFudWvvfL64fnB2QeXi8mGaDzXipY81qwXCPcEl8Jh1TDclzLSSoYV235VmRHTXNY4sWPjCMwNtaYoYsMTeJgkg8o+aSYPwupznPXauXDhAcrBwL8j83fPJO1R8Wgedc1l3ImxsXXVpHyQTW4po2vhAhH1D5QfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707879429; c=relaxed/simple;
	bh=ZItv8oA7eXQZp0Qu6xV0kwdtHxsME37l4NKNWnd0vao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AusNFzvEkvT10yBpPTgaZ1IJ3yAqhHFMObspP67aoFo+j74/OhNGHv7CC+/kB0nc8M2KKuaz1O7k6ZA0F6pGvB2nm8rD2S7XhaRf6gwmCgOPV05o4ycyEMFe/REDLIAVGlkue0wRTZXBNvh4hFS5udgP5zpgYBAy8Js8mNQcakE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d08N6oUE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d08N6oUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707879427; x=1739415427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZItv8oA7eXQZp0Qu6xV0kwdtHxsME37l4NKNWnd0vao=;
  b=d08N6oUEVZn2e1FxvK4J3CkwWz6SXFsTAyQqNklCcBervzVhRTXu7Bdu
   1PcjV7amu144zLeesLqmRHQh2OEy1lYf/lkccpU0oU85F9a71u+gUjxB9
   xvE3SG/r+zNWuxVfxfxnNc0flDo7TqoJA/M4Y5g7P+BvTvwyymdO+9eB6
   iRNMD1X3E9WNCfVPZlgrUWYljol98VHbvS2fsWhp7i6hFHvuF1KVxu48/
   D+cSTrhRa2V+IBrxWb0fSB8sfa62i4x8wUGkmc3C2C31yP+dLu4GTqsGX
   wXDIhlHx2hFxhq/Q+CNC6ZlRzFYCROZZ6ciO1N8HkDq6bu86I7N8WTGuz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1785141"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1785141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 18:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7708035"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2024 18:57:05 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra5SJ-0008Fg-1N;
	Wed, 14 Feb 2024 02:57:03 +0000
Date: Wed, 14 Feb 2024 10:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/4] media: ivsc: csi: Use IPU bridge
Message-ID: <202402141003.GR4DOSY3-lkp@intel.com>
References: <20240213130815.382792-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213130815.382792-5-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master linus/master v6.8-rc4 next-20240213]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu-bridge-Add-ov01a10-in-Dell-XPS-9315/20240213-211311
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240213130815.382792-5-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 4/4] media: ivsc: csi: Use IPU bridge
config: i386-randconfig-006-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141003.GR4DOSY3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141003.GR4DOSY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141003.GR4DOSY3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ivsc/mei_csi.c:30:10: fatal error: media/ipu6-pci-table.h: No such file or directory
    #include <media/ipu6-pci-table.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +30 drivers/media/pci/intel/ivsc/mei_csi.c

    28	
    29	#include <media/ipu-bridge.h>
  > 30	#include <media/ipu6-pci-table.h>
    31	#include <media/v4l2-async.h>
    32	#include <media/v4l2-ctrls.h>
    33	#include <media/v4l2-fwnode.h>
    34	#include <media/v4l2-subdev.h>
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
