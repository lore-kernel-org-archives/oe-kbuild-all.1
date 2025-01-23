Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64113B7A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737616212; cv=none; b=d1h3y5DTGSmUAw/FjuH1+c1xtjYnBP5JgbRK5wvl9O49H3g1BMjt10P8MHy5akrzuVkn4eakdcd9n9WXdIlHpaCizMFIkgJrLY2usCmMt1KiapqRMwd+SUXiLEwugzwBFJi3jtH5Z2U6CmmdJHKCiJIKkOhNzowipxtmv5/4ZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737616212; c=relaxed/simple;
	bh=Gu89el8KzxbmhO9NPYyscmHGrl1HMALGlH9Oke1OqMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGuoDblfcrZGAJzHK6ZABuN1BbLJNfIh0NLnKa/ljFdsntHUF4p0LIZNFUJzsLsuWGuEqxHXbSwbYXf8Nw85dI0v7BVPp04vtOXvdt533vaoHKwlLNwnFK7jl8qU6ck1zhbM5wGtjHskk5dWobd3t32vk/15XRWmru3EyCTRj6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV+OxmGU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV+OxmGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737616211; x=1769152211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gu89el8KzxbmhO9NPYyscmHGrl1HMALGlH9Oke1OqMw=;
  b=lV+OxmGUDVbLO3TMbEELPgJPbk39Vx7ZWrKDfTfvt9y2LHS3bWi08xGE
   7dY/xNXn3AjJw4s3xCG2HNAmg8zckp0rUFtPE6ehwPUPvSKb8eA1BwMB7
   Jpb8LyKn1knqTuprNhoDoRiZRYAgh3ODVudXfzOWll6wXPFfwWgjUqxFj
   7GbihO2s1YbbtgsbQQf+amiGbGzLuAJ+asYqsSnmBE3NB7UUksuwQdCeU
   rybWd19mOKek4U0fUpFd4WkW8K8UOTYAz2DLiZXUw42pNMEa+IilA/G1/
   m/VO3JOUHtG88907kMf+JsvZkombkvyuoHli5b4OYQxvytbtCyg8Q6CWS
   A==;
X-CSE-ConnectionGUID: LbftoFSSTgGSImoQ7iQQjg==
X-CSE-MsgGUID: jja7Jv02TgWJa5Jg9DF5Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38205247"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38205247"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:10:11 -0800
X-CSE-ConnectionGUID: 4LMjoFQsRrW0iNvw+VvmHg==
X-CSE-MsgGUID: 5tgs2LiRR4S2CYnSxwfI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107230506"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jan 2025 23:10:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tarLq-000arv-0c;
	Thu, 23 Jan 2025 07:10:06 +0000
Date: Thu, 23 Jan 2025 15:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 36/83]
 drivers/soundwire/debugfs.c:300:30: warning: format '%ld' expects argument
 of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202501231507.gOqcfPTX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   4dbf0a74815675188836424b784024cdf13365f9
commit: feae4ee142eeeccad34203a42a4d63019a46062c [36/83] soundwire: debugfs: add interface for BPT/BRA transfers
config: arm-randconfig-003-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231507.gOqcfPTX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231507.gOqcfPTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231507.gOqcfPTX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:610,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/soundwire/debugfs.c:5:
   drivers/soundwire/debugfs.c: In function 'cmd_go':
>> drivers/soundwire/debugfs.c:300:30: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     300 |         dev_dbg(&slave->dev, "command completed, num_byte %ld status %d, time %lld ms\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/soundwire/debugfs.c:300:9: note: in expansion of macro 'dev_dbg'
     300 |         dev_dbg(&slave->dev, "command completed, num_byte %ld status %d, time %lld ms\n",
         |         ^~~~~~~
   drivers/soundwire/debugfs.c:300:61: note: format string is defined here
     300 |         dev_dbg(&slave->dev, "command completed, num_byte %ld status %d, time %lld ms\n",
         |                                                           ~~^
         |                                                             |
         |                                                             long int
         |                                                           %d


vim +300 drivers/soundwire/debugfs.c

   234	
   235	static int cmd_go(void *data, u64 value)
   236	{
   237		const struct firmware *fw = NULL;
   238		struct sdw_slave *slave = data;
   239		ktime_t start_t;
   240		ktime_t finish_t;
   241		int ret;
   242	
   243		if (value != 1)
   244			return -EINVAL;
   245	
   246		/* one last check */
   247		if (start_addr > SDW_REG_MAX ||
   248		    num_bytes == 0 || num_bytes > MAX_CMD_BYTES)
   249			return -EINVAL;
   250	
   251		ret = pm_runtime_get_sync(&slave->dev);
   252		if (ret < 0 && ret != -EACCES) {
   253			pm_runtime_put_noidle(&slave->dev);
   254			return ret;
   255		}
   256	
   257		if (cmd == 0) {
   258			ret = request_firmware(&fw, firmware_file, &slave->dev);
   259			if (ret < 0) {
   260				dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
   261				goto out;
   262			}
   263			if (fw->size < num_bytes) {
   264				dev_err(&slave->dev,
   265					"firmware %s: firmware size %zd, desired %zd\n",
   266					firmware_file, fw->size, num_bytes);
   267				goto out;
   268			}
   269		}
   270	
   271		/* Userspace changed the hardware state behind the kernel's back */
   272		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
   273	
   274		dev_dbg(&slave->dev, "starting command\n");
   275		start_t = ktime_get();
   276	
   277		if (cmd == 0) {
   278			if (cmd_type)
   279				ret = do_bpt_sequence(slave, true, (u8 *)fw->data);
   280			else
   281				ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
   282		} else {
   283			memset(read_buffer, 0, sizeof(read_buffer));
   284	
   285			if (cmd_type)
   286				ret = do_bpt_sequence(slave, false, read_buffer);
   287			else
   288				ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
   289		}
   290	
   291		finish_t = ktime_get();
   292	
   293	out:
   294		if (fw)
   295			release_firmware(fw);
   296	
   297		pm_runtime_mark_last_busy(&slave->dev);
   298		pm_runtime_put(&slave->dev);
   299	
 > 300		dev_dbg(&slave->dev, "command completed, num_byte %ld status %d, time %lld ms\n",
   301			num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
   302	
   303		return ret;
   304	}
   305	DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
   306				 cmd_go, "%llu\n");
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
