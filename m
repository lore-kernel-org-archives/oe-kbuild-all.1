Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCE2156FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702875; cv=none; b=a1dQ5KBnb7lOLlx2WzfzfkDVspMTpTRumJ+lhvgxynRgjQNy7KJqtql7j18a2628MsKfwBk2VBR5YEY/fypeSYaSpE298FnEfKG94iZHLDrGxcVOaqb36tlGdLCaTFbmPtjug9hLQOk5WqD+kNv/GMvQ2QYrhpOIXPRvE9+ncT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702875; c=relaxed/simple;
	bh=i8Igj770C0astvzP4b7KDeeYKJmQGOHUBrq0CjJ4F1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mz8HRpMDeO5SGdrjP1985KqN1DQ2+hrBBhWMThyNSeg3e79GNSe7VwF+eZCjW/PAMkO73dMdqHgBr8MIfs5b6hiBjL0X1ZDClYWiBmR7VqNPEA9/wmXzPnXyCekoE9iGK42EcpX6DcBI1jOdGxXC/qT9sEr7wo0o0lKP6m4E2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/EefhZ0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/EefhZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734702874; x=1766238874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8Igj770C0astvzP4b7KDeeYKJmQGOHUBrq0CjJ4F1c=;
  b=A/EefhZ0Umqmnnugd+IWtLZkhWQEW/GyxU6YMr3c4f7RJ+Z/j0vMoXc5
   ZG0Pdy48SONzKCjP6tqcny3jM7w58UOmYGdTZA0t1vaHX4k1dfqazuQwO
   kNekR1r4L7ClZnC9UGlWPaZBZDMUu1kO166YeK98Bf6H6OJxp96tqLb4v
   AZYFkGLF3ObXs35+yePTskXRzPXj2bINsBbrlaEUtepY4Yajx77iIXnaQ
   3iLdjeC5HKfRLfT3zpyWJyl5eEyCzOXWmq9lCYBUnifUikY8C7NbS0lFK
   AeSuogLK8X6XNIFgwcXRntFrgEd6N5PvFooBTrfH0184ZRiOdaJOl888u
   w==;
X-CSE-ConnectionGUID: ffBf167+SrOp1VwgKHKVxA==
X-CSE-MsgGUID: BGa8dj9ESsWs5b3Vv8spMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35133879"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35133879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:54:29 -0800
X-CSE-ConnectionGUID: tAoZJDr9Qn+LZ/VJdmoOJg==
X-CSE-MsgGUID: 1466quViRMS3u6yJhVy2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103507840"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 05:54:27 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOdSS-0001CP-0z;
	Fri, 20 Dec 2024 13:54:24 +0000
Date: Fri, 20 Dec 2024 21:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X' directive
 output may be truncated writing between 4 and 8 bytes into a region of size
 5
Message-ID: <202412202139.tZ2VJL2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eddie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 2f8a855efe8a6faf962c53af406e5ea4791b3877 pmbus: (ibm-cffps) Add support for version 2 of the PSU
date:   5 years ago
config: x86_64-randconfig-077-20241209 (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202139.tZ2VJL2f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/ibm-cffps.c: In function 'ibm_cffps_debugfs_op':
   drivers/hwmon/pmbus/ibm-cffps.c:171:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
     171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                                            ^~~~
   drivers/hwmon/pmbus/ibm-cffps.c:171:59: note: directive argument in the range [0, 2147483647]
     171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                                           ^~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:171:33: note: 'snprintf' output between 3 and 9 bytes into a destination of size 3
     171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X' directive output may be truncated writing between 4 and 8 bytes into a region of size 5 [-Wformat-truncation=]
     184 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                                            ^~~~
   drivers/hwmon/pmbus/ibm-cffps.c:184:59: note: directive argument in the range [0, 2147483647]
     184 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                                           ^~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:184:33: note: 'snprintf' output between 5 and 9 bytes into a destination of size 5
     184 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +184 drivers/hwmon/pmbus/ibm-cffps.c

   129	
   130	static ssize_t ibm_cffps_debugfs_op(struct file *file, char __user *buf,
   131					    size_t count, loff_t *ppos)
   132	{
   133		u8 cmd;
   134		int i, rc;
   135		int *idxp = file->private_data;
   136		int idx = *idxp;
   137		struct ibm_cffps *psu = to_psu(idxp, idx);
   138		char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
   139	
   140		pmbus_set_page(psu->client, 0);
   141	
   142		switch (idx) {
   143		case CFFPS_DEBUGFS_INPUT_HISTORY:
   144			return ibm_cffps_read_input_history(psu, buf, count, ppos);
   145		case CFFPS_DEBUGFS_FRU:
   146			cmd = CFFPS_FRU_CMD;
   147			break;
   148		case CFFPS_DEBUGFS_PN:
   149			cmd = CFFPS_PN_CMD;
   150			break;
   151		case CFFPS_DEBUGFS_SN:
   152			cmd = CFFPS_SN_CMD;
   153			break;
   154		case CFFPS_DEBUGFS_CCIN:
   155			rc = i2c_smbus_read_word_swapped(psu->client, CFFPS_CCIN_CMD);
   156			if (rc < 0)
   157				return rc;
   158	
   159			rc = snprintf(data, 5, "%04X", rc);
   160			goto done;
   161		case CFFPS_DEBUGFS_FW:
   162			switch (psu->version) {
   163			case cffps1:
   164				for (i = 0; i < CFFPS1_FW_NUM_BYTES; ++i) {
   165					rc = i2c_smbus_read_byte_data(psu->client,
   166								      CFFPS_FW_CMD +
   167									i);
   168					if (rc < 0)
   169						return rc;
   170	
   171					snprintf(&data[i * 2], 3, "%02X", rc);
   172				}
   173	
   174				rc = i * 2;
   175				break;
   176			case cffps2:
   177				for (i = 0; i < CFFPS2_FW_NUM_WORDS; ++i) {
   178					rc = i2c_smbus_read_word_data(psu->client,
   179								      CFFPS_FW_CMD +
   180									i);
   181					if (rc < 0)
   182						return rc;
   183	
 > 184					snprintf(&data[i * 4], 5, "%04X", rc);
   185				}
   186	
   187				rc = i * 4;
   188				break;
   189			default:
   190				return -EOPNOTSUPP;
   191			}
   192			goto done;
   193		default:
   194			return -EINVAL;
   195		}
   196	
   197		rc = i2c_smbus_read_block_data(psu->client, cmd, data);
   198		if (rc < 0)
   199			return rc;
   200	
   201	done:
   202		data[rc] = '\n';
   203		rc += 2;
   204	
   205		return simple_read_from_buffer(buf, count, ppos, data, rc);
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
