Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BBC14A4D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669701; cv=none; b=aNnsX2adecixn1M0lZCCNX/R45sK6Kh/WYbfK1h79nXjKNATxQlvWUGM2Ud8efLNJ5vcnqI+STucjMu4u3weuu2nj0zVn1OxO4a46+ASfZpB0I1tXDjABM04xnpyh3iUNJFpg2QS5Yggvdbmu2IcQ0Wh0uUR6EQapytzxSeFq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669701; c=relaxed/simple;
	bh=W8nuNbBdEHlJVtYL4VjX6VZb/AtBfROqXOtG3u4vP/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXVbR+soqN5P2WU6utxE/sPOgnlDuJQN12+7maKoD9zTvz5snccEA/mNQr6LvjEqUMIgHzvJ5u7AoNvxYtYLiz57Q6LQl9xxhiiOjKIpttfoFKoW6dkOvdg5RFmpnWzVr3QCcPll+dL86DNF0wjMK4QG1QfFHQv0PZTp2IGZOjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iebN5L1U; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iebN5L1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724669700; x=1756205700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8nuNbBdEHlJVtYL4VjX6VZb/AtBfROqXOtG3u4vP/M=;
  b=iebN5L1UvBZKHJ3Wt0mXd2SCWID0+UBtsGH8k9vELvvVZ8z9HKHV543g
   C5HqpD+yXOncheEI5YtJ0N0Jsi48fMyvOkCZu6i8gdi1t65NqsXqFg/c8
   H80NvhAkXmFMP+w4MJNG56g4iVg8hbOK4t5vj1ThJR+bjJnDrAXOH51wx
   RevvjPNrFZax1mk2LL5tx24+wzrYn7zIBXfsgR7BCjWxp3cJUY3o8zSDU
   gUcV8rocIpXOFGhaHYFMx+fUDAWx9snb99Eb25/xa6km2Puv1T1nchI9Y
   2y9LFBnUcKY3iRbjc1WVrVZ6mFFp9XoGzibDl3MD7N35dCdU/Q8k8P3ol
   A==;
X-CSE-ConnectionGUID: 4L43MoVNS6y92DXXD0lBDQ==
X-CSE-MsgGUID: ycPE2gKRQ3GiYC3icxZbsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33704996"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33704996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:54:59 -0700
X-CSE-ConnectionGUID: PKPrqmHEQay8bHoY/wI+mg==
X-CSE-MsgGUID: Bf8C/Mj7T2i+ak5igUEWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93202995"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 03:54:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siXN8-000Gwy-2o;
	Mon, 26 Aug 2024 10:54:54 +0000
Date: Mon, 26 Aug 2024 18:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	Sanket.Goswami@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support
 AMD ASF with SMBus
Message-ID: <202408261818.T8eXqGIz-lkp@intel.com>
References: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822142200.686842-3-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i2c-piix4-Allow-more-than-two-algo-selection-for-SMBus/20240826-113028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240822142200.686842-3-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 2/5] i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
config: i386-randconfig-016-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261818.T8eXqGIz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261818.T8eXqGIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261818.T8eXqGIz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-piix4.c:1069:10: error: 'const struct i2c_algorithm' has no member named 'reg_slave'
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |          ^~~~~~~~~
>> drivers/i2c/busses/i2c-piix4.c:1069:22: error: initialization of 'int (*)(struct i2c_adapter *, struct i2c_msg *, int)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:1069:22: note: (near initialization for 'sb800_asf_smbus_algorithm.<anonymous>.xfer_atomic')
>> drivers/i2c/busses/i2c-piix4.c:1070:10: error: 'const struct i2c_algorithm' has no member named 'unreg_slave'
    1070 |         .unreg_slave = sb800_asf_unreg_slave,
         |          ^~~~~~~~~~~
>> drivers/i2c/busses/i2c-piix4.c:1070:24: error: initialization of 'int (*)(struct i2c_adapter *, u16,  short unsigned int,  char,  u8,  int,  union i2c_smbus_data *)' {aka 'int (*)(struct i2c_adapter *, short unsigned int,  short unsigned int,  char,  unsigned char,  int,  union i2c_smbus_data *)'} from incompatible pointer type 'int (*)(struct i2c_client *)' [-Werror=incompatible-pointer-types]
    1070 |         .unreg_slave = sb800_asf_unreg_slave,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-piix4.c:1070:24: note: (near initialization for 'sb800_asf_smbus_algorithm.smbus_xfer')
>> drivers/i2c/busses/i2c-piix4.c:1067:63: warning: missing braces around initializer [-Wmissing-braces]
    1067 | static const struct i2c_algorithm sb800_asf_smbus_algorithm = {
         |                                                               ^
    1068 |         .master_xfer = sb800_asf_xfer,
         |                                      }
    1069 |         .reg_slave = sb800_asf_reg_slave,
         |                      {                  }
   cc1: some warnings being treated as errors


vim +1069 drivers/i2c/busses/i2c-piix4.c

  1066	
> 1067	static const struct i2c_algorithm sb800_asf_smbus_algorithm = {
  1068		.master_xfer = sb800_asf_xfer,
> 1069		.reg_slave = sb800_asf_reg_slave,
> 1070		.unreg_slave = sb800_asf_unreg_slave,
  1071		.functionality = sb800_asf_func,
  1072	};
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
