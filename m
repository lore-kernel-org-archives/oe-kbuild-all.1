Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C481AD23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752885979; cv=none; b=JkZd5JjAoMnKxCuOK1C2d+oYXWw5iPAGfa6TxcV/TPVBuLyg2urklrxb/VgaL+6Jt2byVwS3A2SsFpLpPhG9wMQ/5WggxzYjxUAxGuHBjBzoaJUkvGMJlcdW5b4XkrjyIOQKMdz9gUf4SHnGObTn98v3+Zj2FYp4oykhkUwGgHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752885979; c=relaxed/simple;
	bh=sHVK+o/maKVsX9aoh7fRAQ2DWovhgiCMkKfZ91jvNd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+iLnWumNt9MFwiR8Pl399gV0zZVItbT+NQ0UnlWGh63s2PlTf6B4lNozkcxHvdH4ysGiYzLdPl5CdwqSSVxWmgbr18JgkTROqorrSIFOtB4wI2xRTjWm28ugz7f/MZ4SrP48L2LNgC5H3pl1hyVKTRAi7JHNxnisKs0cP3smEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RanFFM6Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RanFFM6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752885978; x=1784421978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sHVK+o/maKVsX9aoh7fRAQ2DWovhgiCMkKfZ91jvNd4=;
  b=RanFFM6ZtrJx9Iz6DfQEolU2BIScL9rf7Z+AQi3yjTUqH4LFsYQkpzwV
   jTSKFO1Xr/D6qr8lH2y9WYV8wikrSaL6Fu3oOOyJi+6wCESSVclxQm7vL
   DasRdL2KnmMiIO90HMn3aVMytprW+JmR5UYL4yEFw/rH6qbag3O5ewKvt
   JCiMsu6gyDytTNOaTCsavki5GascLlQchZ9GLe50U2GKE8MFcFaC9TOSw
   QtK36jlamjP95lHTcTpq3j7LeyAJ3w4Ho4uVIit3eFkpq4G6g6eGdl3Fk
   OjvGYmca3mU/vCOsJ6Qv38ntqrh72+gDFg56EevUnp5Jgh/78j7y3I+hv
   Q==;
X-CSE-ConnectionGUID: s5ukxVoBSYmpoFhR1v+pmg==
X-CSE-MsgGUID: KjvdfH5HQOy6UfH/Bxa16A==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54397052"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="54397052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 17:46:17 -0700
X-CSE-ConnectionGUID: B27O95sKTymoZbvkf+PSoA==
X-CSE-MsgGUID: syfJzeuMSfWXk5Ofi1cw+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="189346245"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2025 17:46:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucviP-000FAV-02;
	Sat, 19 Jul 2025 00:46:13 +0000
Date: Sat, 19 Jul 2025 08:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Darshan Rathod <darshanrathod475@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if
 condition
Message-ID: <202507190855.RA0Awmj9-lkp@intel.com>
References: <20250718125245.82910-1-darshanrathod475@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718125245.82910-1-darshanrathod475@gmail.com>

Hi Darshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on sailus-media-tree/master linus/master media-tree/master sailus-media-tree/streams v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darshan-Rathod/media-b2c2-flexcop-eeprom-Fix-assignment-in-if-condition/20250718-205456
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250718125245.82910-1-darshanrathod475%40gmail.com
patch subject: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if condition
config: i386-randconfig-002-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190855.RA0Awmj9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190855.RA0Awmj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190855.RA0Awmj9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/common/b2c2/flexcop-eeprom.c: In function 'flexcop_eeprom_check_mac_addr':
>> drivers/media/common/b2c2/flexcop-eeprom.c:143:29: warning: operation on 'ret' may be undefined [-Wsequence-point]
     143 |                         ret = ret = -EINVAL;
   drivers/media/common/b2c2/flexcop-eeprom.c:149:1: error: expected declaration or statement at end of input
     149 | EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);
         | ^~~~~~~~~~~~~
>> drivers/media/common/b2c2/flexcop-eeprom.c:150: warning: control reaches end of non-void function [-Wreturn-type]


vim +/ret +143 drivers/media/common/b2c2/flexcop-eeprom.c

   130	
   131	/* JJ's comment about extended == 1: it is not presently used anywhere but was
   132	 * added to the low-level functions for possible support of EUI64 */
   133	int flexcop_eeprom_check_mac_addr(struct flexcop_device *fc, int extended)
   134	{
   135		u8 buf[8];
   136		int ret = 0;
   137	
   138		ret = flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);
   139	
   140		if (ret == 0) {
   141			if (extended != 0) {
   142				err("TODO: extended (EUI64) MAC addresses aren't completely supported yet");
 > 143				ret = ret = -EINVAL;
   144			} else {
   145				memcpy(fc->dvb_adapter.proposed_mac, buf, 6);
   146			}
   147			return ret;
   148	}
   149	EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
