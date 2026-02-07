Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445761D6193
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 11:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770462344; cv=none; b=Rhvl/XNRvRR4I6RWel1cQYcMnixQEjieQlV6TvniWaor2NL2p1YXn8XHc/stBk+GeLFj6qZaysShwJJnelyQJpegRB652AnaYmkl2Fji3cUNfwU/cobRURXQaQjjkRxLwGZ4ozt2PSnW/G2UHcJ2qu0j0pPVYr+kqic0NF0OTSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770462344; c=relaxed/simple;
	bh=LcJAUWF/3Oe1UJRTXKu+i0TtwNH81GLm+6SxQxVMbQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFqiAwTaQV1nAEv5/30IVhG3Dg76oHLn54moS5ryJ6F65E/YJ+BeKN+BrD45vl9kOuCIENn6/TJKEXStGUh+3G2jCBLLeGuKBg8eW7BskvFV9dAJsJ8/Ouv3+hdnQtfoUop3QB5vmwaGlr1Au8f/65qZRJRXyngGhj6vlcsCDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1l98EPQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1l98EPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770462344; x=1801998344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcJAUWF/3Oe1UJRTXKu+i0TtwNH81GLm+6SxQxVMbQM=;
  b=m1l98EPQDqZNRdmmTvCw1FxRgq5QJwYfQwoa3k9R+/F3dFmsC0ARQ6Za
   tnK2RU8SKMKL3T86HR4eCQtDynlTtrjtY8QZkka5bBjiApRYPfdqlJUfN
   4Q4wl8+Sfwb2a6bmbmvrgwuYdrFHlNND/Uy0Lt3qGINkmTgE1EDozI7jR
   dKHnMIpAwETlkGBnd1UQm5yeBld/rh01BC2LCvuKykr/g9xSupPqopXhd
   R9rXvr/wyaISUGPhtd/XNEHJJ7B2wUaMgG6UU7wNqX1P2GQ+A6gcRakTo
   3Zyw5Hx8La0dFqHIISQazkW1fsaXRBAS+HTuCKFRO1Ul7/3BMmNak/5xz
   A==;
X-CSE-ConnectionGUID: X03Q3KggSHKVW46PB/pNAw==
X-CSE-MsgGUID: NcqFYUhrToi1iEtF5GDjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70847812"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70847812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 03:05:44 -0800
X-CSE-ConnectionGUID: KqtSxh00RcK4ZpJpftAHqg==
X-CSE-MsgGUID: uqlFWAWRRxCHnRy84Zh3Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234059155"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 03:05:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vog8A-00000000lbM-2iTi;
	Sat, 07 Feb 2026 11:05:38 +0000
Date: Sat, 7 Feb 2026 19:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
Message-ID: <202602071928.rf2Gjdgd-lkp@intel.com>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>

Hi Carl,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f]

url:    https://github.com/intel-lab-lkp/linux/commits/Carl-Lee-via-B4-Relay/dt-bindings-hwmon-pmbus-mpq8785-add-MPQ8786-support/20260205-180428
base:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
patch link:    https://lore.kernel.org/r/20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850%40amd.com
patch subject: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID VOUT on MPQ8785/MPQ8786
config: i386-randconfig-141-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071928.rf2Gjdgd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071928.rf2Gjdgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071928.rf2Gjdgd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mpq8785.c:63:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
      63 |         default:
         |         ^
   drivers/hwmon/pmbus/mpq8785.c:63:2: note: insert '__attribute__((fallthrough));' to silence this warning
      63 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/hwmon/pmbus/mpq8785.c:63:2: note: insert 'break;' to avoid fall-through
      63 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +63 drivers/hwmon/pmbus/mpq8785.c

    50	
    51	static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
    52	{
    53		int ret;
    54	
    55		switch (reg) {
    56		case PMBUS_VOUT_MODE:
    57			ret = pmbus_read_byte_data(client, page, reg);
    58			if (ret < 0)
    59				return ret;
    60	
    61			if ((ret >> 5) == 1)
    62				return PB_VOUT_MODE_DIRECT;
  > 63		default:
    64			return -ENODATA;
    65		}
    66	
    67		return ret;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
