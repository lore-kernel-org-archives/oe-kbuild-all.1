Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9321D3F5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Aug 2025 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756643998; cv=none; b=cY0JGG1DzUQX9ySq2oGPFcxp+IX2JYdACiT9Bc18FYE7vjpieafL03m4cYGzyjJ104KuGnepNnTCcQ0vWXt/LCr+6rt1aE91SL+ZEIGhlXCMx1sKhFc6aC7aj1RuxdiYwyBMSzjylw1BquNjIRRDTWrkA/lvM4C8vArqq3TTnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756643998; c=relaxed/simple;
	bh=eoBt5yNqWgDE1Dz+X3O7H8q//J7NNa+AGitH+NAUNR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fKONn87FFMgyDU3ltCB0trbUGp3Y8FTIWSMbJWuUQZchKDjCaNTtNJF8QRcjIkKwXnCnsxobqCoJdxsCMptTN8R3u9RTdqXbrulwpbeOv48OU2yWHgjcll/h2N7l01jiIL0+LgggesaXFk3ER4kI9oSpqltHD2MFDAxT5OKblFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqowJT/f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqowJT/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756643996; x=1788179996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoBt5yNqWgDE1Dz+X3O7H8q//J7NNa+AGitH+NAUNR0=;
  b=LqowJT/fhNFUBPPSQ7CYILLhQ7aptQGYf8CK+ZxlCT0hHhZOK64WNsFx
   gYS6wqJxHW/JzLg1GksstW+UgvVGJvwndJqX3eUnve7d9w9wG9OWK/mEn
   UqXW+vlgH/+IzVYQoNPlRtuiRdOR4kLFwf7BBbGkBJGOZzKNmPb+opJik
   2QgtGvplPtc2L0WQ09jLcIkjTd8O/EBikj3EFZULYPf9kcF3rHXIgOXcW
   OyOkLEqPogqPrbTjnNJTLuAf6/Jk26rRiQ5dToRRh9OBfAnHEmw1g7XYg
   GzDQP7HFWrQdo7Ocw0yPqf5rL/WP4kChPncf2eMCxagKthgy1NJt1JMD1
   w==;
X-CSE-ConnectionGUID: NYcrstUfQJuUKOOUHAL4JQ==
X-CSE-MsgGUID: YZyaT0XQR5ayTCBOmvffpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81452251"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81452251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 05:39:56 -0700
X-CSE-ConnectionGUID: 5j0l7M0UQ+a1ED/cO9PE6A==
X-CSE-MsgGUID: gp32dayZTsqRrmSE0mu3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170670867"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2025 05:39:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ushLb-000W7f-2y;
	Sun, 31 Aug 2025 12:39:51 +0000
Date: Sun, 31 Aug 2025 20:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 2592/5283]
 drivers/net/ethernet/cadence/macb_main.c:4107 macb_taprio_setup_replace()
 warn: unsigned 'start_time' is never less than zero.
Message-ID: <202508312039.APF4zkL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cace99d63192a7250461b058279a42d91075d0c
commit: 89934dbf169e358b57c2b394bb51a57d3f259dc0 [2592/5283] net: macb: Add TAPRIO traffic scheduling support
config: i386-randconfig-r073-20250831 (https://download.01.org/0day-ci/archive/20250831/202508312039.APF4zkL7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508312039.APF4zkL7-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/cadence/macb_main.c:4107 macb_taprio_setup_replace() warn: unsigned 'start_time' is never less than zero.

vim +/start_time +4107 drivers/net/ethernet/cadence/macb_main.c

  4087	
  4088	static int macb_taprio_setup_replace(struct net_device *ndev,
  4089					     struct tc_taprio_qopt_offload *conf)
  4090	{
  4091		u64 total_on_time = 0, start_time_sec = 0, start_time = conf->base_time;
  4092		u32 configured_queues = 0, speed = 0, start_time_nsec;
  4093		struct macb_queue_enst_config *enst_queue;
  4094		struct tc_taprio_sched_entry *entry;
  4095		struct macb *bp = netdev_priv(ndev);
  4096		struct ethtool_link_ksettings kset;
  4097		struct macb_queue *queue;
  4098		size_t i;
  4099		int err;
  4100	
  4101		if (conf->num_entries > bp->num_queues) {
  4102			netdev_err(ndev, "Too many TAPRIO entries: %zu > %d queues\n",
  4103				   conf->num_entries, bp->num_queues);
  4104			return -EINVAL;
  4105		}
  4106	
> 4107		if (start_time < 0) {
  4108			netdev_err(ndev, "Invalid base_time: must be 0 or positive, got %lld\n",
  4109				   conf->base_time);
  4110			return -ERANGE;
  4111		}
  4112	
  4113		/* Get the current link speed */
  4114		err = phylink_ethtool_ksettings_get(bp->phylink, &kset);
  4115		if (unlikely(err)) {
  4116			netdev_err(ndev, "Failed to get link settings: %d\n", err);
  4117			return err;
  4118		}
  4119	
  4120		speed = kset.base.speed;
  4121		if (unlikely(speed <= 0)) {
  4122			netdev_err(ndev, "Invalid speed: %d\n", speed);
  4123			return -EINVAL;
  4124		}
  4125	
  4126		enst_queue = kcalloc(conf->num_entries, sizeof(*enst_queue), GFP_KERNEL);
  4127		if (unlikely(!enst_queue))
  4128			return -ENOMEM;
  4129	
  4130		/* Pre-validate all entries before making any hardware changes */
  4131		for (i = 0; i < conf->num_entries; i++) {
  4132			entry = &conf->entries[i];
  4133	
  4134			if (entry->command != TC_TAPRIO_CMD_SET_GATES) {
  4135				netdev_err(ndev, "Entry %zu: unsupported command %d\n",
  4136					   i, entry->command);
  4137				err = -EOPNOTSUPP;
  4138				goto cleanup;
  4139			}
  4140	
  4141			/* Validate gate_mask: must be nonzero, single queue, and within range */
  4142			if (!is_power_of_2(entry->gate_mask)) {
  4143				netdev_err(ndev, "Entry %zu: gate_mask 0x%x is not a power of 2 (only one queue per entry allowed)\n",
  4144					   i, entry->gate_mask);
  4145				err = -EINVAL;
  4146				goto cleanup;
  4147			}
  4148	
  4149			/* gate_mask must not select queues outside the valid queue_mask */
  4150			if (entry->gate_mask & ~bp->queue_mask) {
  4151				netdev_err(ndev, "Entry %zu: gate_mask 0x%x exceeds queue range (max_queues=%d)\n",
  4152					   i, entry->gate_mask, bp->num_queues);
  4153				err = -EINVAL;
  4154				goto cleanup;
  4155			}
  4156	
  4157			/* Check for start time limits */
  4158			start_time_sec = start_time;
  4159			start_time_nsec = do_div(start_time_sec, NSEC_PER_SEC);
  4160			if (start_time_sec > GENMASK(GEM_START_TIME_SEC_SIZE - 1, 0)) {
  4161				netdev_err(ndev, "Entry %zu: Start time %llu s exceeds hardware limit\n",
  4162					   i, start_time_sec);
  4163				err = -ERANGE;
  4164				goto cleanup;
  4165			}
  4166	
  4167			/* Check for on time limit */
  4168			if (entry->interval > enst_max_hw_interval(speed)) {
  4169				netdev_err(ndev, "Entry %zu: interval %u ns exceeds hardware limit %llu ns\n",
  4170					   i, entry->interval, enst_max_hw_interval(speed));
  4171				err = -ERANGE;
  4172				goto cleanup;
  4173			}
  4174	
  4175			/* Check for off time limit*/
  4176			if ((conf->cycle_time - entry->interval) > enst_max_hw_interval(speed)) {
  4177				netdev_err(ndev, "Entry %zu: off_time %llu ns exceeds hardware limit %llu ns\n",
  4178					   i, conf->cycle_time - entry->interval,
  4179					   enst_max_hw_interval(speed));
  4180				err = -ERANGE;
  4181				goto cleanup;
  4182			}
  4183	
  4184			enst_queue[i].queue_id = order_base_2(entry->gate_mask);
  4185			enst_queue[i].start_time_mask =
  4186				(start_time_sec << GEM_START_TIME_SEC_OFFSET) |
  4187				start_time_nsec;
  4188			enst_queue[i].on_time_bytes =
  4189				enst_ns_to_hw_units(entry->interval, speed);
  4190			enst_queue[i].off_time_bytes =
  4191				enst_ns_to_hw_units(conf->cycle_time - entry->interval, speed);
  4192	
  4193			configured_queues |= entry->gate_mask;
  4194			total_on_time += entry->interval;
  4195			start_time += entry->interval;
  4196		}
  4197	
  4198		/* Check total interval doesn't exceed cycle time */
  4199		if (total_on_time > conf->cycle_time) {
  4200			netdev_err(ndev, "Total ON %llu ns exceeds cycle time %llu ns\n",
  4201				   total_on_time, conf->cycle_time);
  4202			err = -EINVAL;
  4203			goto cleanup;
  4204		}
  4205	
  4206		netdev_dbg(ndev, "TAPRIO setup: %zu entries, base_time=%lld ns, cycle_time=%llu ns\n",
  4207			   conf->num_entries, conf->base_time, conf->cycle_time);
  4208	
  4209		/* All validations passed - proceed with hardware configuration */
  4210		scoped_guard(spinlock_irqsave, &bp->lock) {
  4211			/* Disable ENST queues if running before configuring */
  4212			gem_writel(bp, ENST_CONTROL,
  4213				   bp->queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
  4214	
  4215			for (i = 0; i < conf->num_entries; i++) {
  4216				queue = &bp->queues[enst_queue[i].queue_id];
  4217				/* Configure queue timing registers */
  4218				queue_writel(queue, ENST_START_TIME,
  4219					     enst_queue[i].start_time_mask);
  4220				queue_writel(queue, ENST_ON_TIME,
  4221					     enst_queue[i].on_time_bytes);
  4222				queue_writel(queue, ENST_OFF_TIME,
  4223					     enst_queue[i].off_time_bytes);
  4224			}
  4225	
  4226			/* Enable ENST for all configured queues in one write */
  4227			gem_writel(bp, ENST_CONTROL, configured_queues);
  4228		}
  4229	
  4230		netdev_info(ndev, "TAPRIO configuration completed successfully: %zu entries, %d queues configured\n",
  4231			    conf->num_entries, hweight32(configured_queues));
  4232	
  4233	cleanup:
  4234		kfree(enst_queue);
  4235		return err;
  4236	}
  4237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
