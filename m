Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7E1384BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348130; cv=none; b=RurlmJekLlxRT2eZowQMh234MEadB7eq7IrZLfqmod7xgI93oqPC4ohzZHlOob6NZGjAFUtkvqBMiXpqbwaY6ehdyr46OFq6KeMtxHsjk/J+yP5PB/bhY1iW9MoaZz7YX3LZggCopVWkb4Qy1kizDOMbTnqC7ccxqRS8bdFZ/ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348130; c=relaxed/simple;
	bh=PRYdnSuDle3podPZa1dbs1paBv95iqVjyXvzy2+Wlig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fyCYp8jIra9zRYe2reD8riMhpz6WoeI5vam/Ytx5mvAO2ITLLnFbrlTLjXPcx3BmWtjmgirBVIC3X3KBKLbsWk/vYftROrhucraMivttLwTOZBEKeSWYRF193XZCgtT47+6Shnd9nuYPE8tBXPQMstujRdV9U6rGNSAJYuUcjj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5WumLkO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5WumLkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713348124; x=1744884124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRYdnSuDle3podPZa1dbs1paBv95iqVjyXvzy2+Wlig=;
  b=I5WumLkOO2su6eft93XmGIrmDdLO9n/VhTcp2zUHZznzm5gCpKh5Q3ne
   NDtNCLVNbA/8tzE1aSuBRcr7NHUZp9/FyhRw0uYLC7OVULdBUo6E7wxXm
   2XNJu1jIugdDzYnOzmMoQzJKioBw8xvnOE2gJYwsu36rCTHQvAC3HSMDV
   FUgiAN9Q1mL7MTKBX4veY3FQ3FIZYtL2vx6+lmkDSp/iMuVXXtDhnM/c0
   wbpHQ4ZqZ9KwmZcFFqnNqIh+P09gyu9xH+DbAMI86IvHNEmNXBP9aWC/T
   U7E6dqFvVdZ04711ghPqxCU2Q/U93eYxl5zrYlycD75EFIpXqIwlN1mE0
   w==;
X-CSE-ConnectionGUID: iMlivd6JQMy3+yr6x0bbVw==
X-CSE-MsgGUID: 7t4YY9mYStWwJpU16vnwEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19977833"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="19977833"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:02:03 -0700
X-CSE-ConnectionGUID: 0Rr1JZSeTPqKZi/CzQb/vQ==
X-CSE-MsgGUID: PbrCBIXmSyqRkMeuGhRkXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27013465"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2024 03:02:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx275-0006SS-0w;
	Wed, 17 Apr 2024 10:01:59 +0000
Date: Wed, 17 Apr 2024 18:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 109/438]
 drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:474:29: error:
 'tl_control_write' undeclared here (not in a function); did you mean
 'tl_control_fops'?
Message-ID: <202404171744.cU59hzzz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   fe753ea36f846c5a5638f1db502ba023e76132ae
commit: 355c93ad4395aa48c6e9908b182144b3752f6bdb [109/438] crypto: qat: convert to read/write iterators
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240417/202404171744.cU59hzzz-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171744.cU59hzzz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171744.cU59hzzz-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD fe753ea36f846c5a5638f1db502ba023e76132ae builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:6:
>> drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:474:29: error: 'tl_control_write' undeclared here (not in a function); did you mean 'tl_control_fops'?
     474 | DEFINE_SHOW_STORE_ATTRIBUTE(tl_control);
         |                             ^~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write          = __name ## _write,                             \
         |                           ^~~~~~
>> drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:670:29: error: 'tl_rp_data_write' undeclared here (not in a function); did you mean 'tl_rp_data_fops'?
     670 | DEFINE_SHOW_STORE_ATTRIBUTE(tl_rp_data);
         |                             ^~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write          = __name ## _write,                             \
         |                           ^~~~~~
>> drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:630:16: warning: 'tl_rp_data_write_iter' defined but not used [-Wunused-function]
     630 | static ssize_t tl_rp_data_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:416:16: warning: 'tl_control_write_iter' defined but not used [-Wunused-function]
     416 | static ssize_t tl_control_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~~~~~~~


vim +474 drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c

69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  415  
355c93ad4395aa Jens Axboe              2024-04-10 @416  static ssize_t tl_control_write_iter(struct kiocb *iocb, struct iov_iter *from)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  417  {
355c93ad4395aa Jens Axboe              2024-04-10  418  	struct seq_file *seq_f = iocb->ki_filp->private_data;
355c93ad4395aa Jens Axboe              2024-04-10  419  	size_t count = iov_iter_count(from);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  420  	struct adf_accel_dev *accel_dev;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  421  	struct adf_telemetry *telemetry;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  422  	struct adf_tl_hw_data *tl_data;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  423  	struct device *dev;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  424  	u32 input;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  425  	int ret;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  426  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  427  	accel_dev = seq_f->private;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  428  	if (!accel_dev)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  429  		return -EINVAL;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  430  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  431  	tl_data = &GET_TL_DATA(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  432  	telemetry = accel_dev->telemetry;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  433  	dev = &GET_DEV(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  434  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  435  	mutex_lock(&telemetry->wr_lock);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  436  
355c93ad4395aa Jens Axboe              2024-04-10  437  	ret = kstrtou32_from_iter(from, count, 10, &input);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  438  	if (ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  439  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  440  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  441  	if (input > tl_data->num_hbuff) {
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  442  		dev_info(dev, "invalid control input\n");
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  443  		ret = -EINVAL;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  444  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  445  	}
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  446  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  447  	/* If input is 0, just stop telemetry. */
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  448  	if (!input) {
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  449  		ret = adf_tl_halt(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  450  		if (!ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  451  			ret = count;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  452  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  453  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  454  	}
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  455  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  456  	/* If TL is already enabled, stop it. */
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  457  	if (atomic_read(&telemetry->state)) {
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  458  		dev_info(dev, "already enabled, restarting.\n");
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  459  		ret = adf_tl_halt(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  460  		if (ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  461  			goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  462  	}
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  463  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  464  	ret = adf_tl_run(accel_dev, input);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  465  	if (ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  466  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  467  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  468  	ret = count;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  469  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  470  unlock_and_exit:
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  471  	mutex_unlock(&telemetry->wr_lock);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  472  	return ret;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  473  }
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22 @474  DEFINE_SHOW_STORE_ATTRIBUTE(tl_control);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  475  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  476  static int get_rp_index_from_file(const struct file *f, u8 *rp_id, u8 rp_num)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  477  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  478  	char alpha;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  479  	u8 index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  480  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  481  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  482  	ret = sscanf(f->f_path.dentry->d_name.name, ADF_TL_RP_REGS_FNAME, &alpha);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  483  	if (ret != 1)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  484  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  485  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  486  	index = ADF_TL_DBG_RP_INDEX_ALPHA(alpha);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  487  	*rp_id = index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  488  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  489  	return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  490  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  491  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  492  static int adf_tl_dbg_change_rp_index(struct adf_accel_dev *accel_dev,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  493  				      unsigned int new_rp_num,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  494  				      unsigned int rp_regs_index)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  495  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  496  	struct adf_hw_device_data *hw_data = GET_HW_DATA(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  497  	struct adf_telemetry *telemetry = accel_dev->telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  498  	struct device *dev = &GET_DEV(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  499  	unsigned int i;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  500  	u8 curr_state;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  501  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  502  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  503  	if (new_rp_num >= hw_data->num_rps) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  504  		dev_info(dev, "invalid Ring Pair number selected\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  505  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  506  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  507  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  508  	for (i = 0; i < hw_data->tl_data.max_rp; i++) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  509  		if (telemetry->rp_num_indexes[i] == new_rp_num) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  510  			dev_info(dev, "RP nr: %d is already selected in slot rp_%c_data\n",
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  511  				 new_rp_num, ADF_TL_DBG_RP_ALPHA_INDEX(i));
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  512  			return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  513  		}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  514  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  515  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  516  	dev_dbg(dev, "selecting RP nr %u into slot rp_%c_data\n",
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  517  		new_rp_num, ADF_TL_DBG_RP_ALPHA_INDEX(rp_regs_index));
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  518  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  519  	curr_state = atomic_read(&telemetry->state);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  520  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  521  	if (curr_state) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  522  		ret = adf_tl_halt(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  523  		if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  524  			return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  525  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  526  		telemetry->rp_num_indexes[rp_regs_index] = new_rp_num;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  527  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  528  		ret = adf_tl_run(accel_dev, curr_state);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  529  		if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  530  			return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  531  	} else {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  532  		telemetry->rp_num_indexes[rp_regs_index] = new_rp_num;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  533  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  534  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  535  	return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  536  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  537  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  538  static void tl_print_rp_srv(struct adf_accel_dev *accel_dev, struct seq_file *s,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  539  			    u8 rp_idx)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  540  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  541  	u32 banks_per_vf = GET_HW_DATA(accel_dev)->num_banks_per_vf;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  542  	enum adf_cfg_service_type svc;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  543  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  544  	seq_printf(s, "%-*s", TL_KEY_MIN_PADDING, RP_SERVICE_TYPE);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  545  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  546  	svc = GET_SRV_TYPE(accel_dev, rp_idx % banks_per_vf);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  547  	switch (svc) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  548  	case COMP:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  549  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, ADF_CFG_DC);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  550  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  551  	case SYM:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  552  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, ADF_CFG_SYM);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  553  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  554  	case ASYM:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  555  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, ADF_CFG_ASYM);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  556  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  557  	default:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  558  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, TL_RP_SRV_UNKNOWN);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  559  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  560  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  561  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  562  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  563  static int tl_print_rp_data(struct adf_accel_dev *accel_dev, struct seq_file *s,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  564  			    u8 rp_regs_index)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  565  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  566  	struct adf_tl_hw_data *tl_data = &GET_TL_DATA(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  567  	struct adf_telemetry *telemetry = accel_dev->telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  568  	const struct adf_tl_dbg_counter *rp_tl_counters;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  569  	u8 num_rp_counters = tl_data->num_rp_counters;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  570  	size_t rp_regs_sz = tl_data->rp_reg_sz;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  571  	struct adf_tl_dbg_counter ctr;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  572  	unsigned int i;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  573  	u8 rp_idx;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  574  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  575  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  576  	if (!atomic_read(&telemetry->state)) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  577  		dev_info(&GET_DEV(accel_dev), "not enabled\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  578  		return -EPERM;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  579  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  580  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  581  	rp_tl_counters = tl_data->rp_counters;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  582  	rp_idx = telemetry->rp_num_indexes[rp_regs_index];
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  583  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  584  	if (rp_idx == ADF_TL_RP_REGS_DISABLED) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  585  		dev_info(&GET_DEV(accel_dev), "no RP number selected in rp_%c_data\n",
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  586  			 ADF_TL_DBG_RP_ALPHA_INDEX(rp_regs_index));
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  587  		return -EPERM;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  588  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  589  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  590  	tl_print_msg_cnt(s, telemetry->msg_cnt);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  591  	seq_printf(s, "%-*s", TL_KEY_MIN_PADDING, RP_NUM_INDEX);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  592  	seq_printf(s, "%*d\n", TL_VALUE_MIN_PADDING, rp_idx);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  593  	tl_print_rp_srv(accel_dev, s, rp_idx);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  594  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  595  	for (i = 0; i < num_rp_counters; i++) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  596  		ctr = rp_tl_counters[i];
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  597  		ctr.offset1 += rp_regs_sz * rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  598  		ctr.offset2 += rp_regs_sz * rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  599  		ret = tl_calc_and_print_counter(telemetry, s, &ctr, NULL);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  600  		if (ret) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  601  			dev_dbg(&GET_DEV(accel_dev),
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  602  				"invalid RP counter type\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  603  			return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  604  		}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  605  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  606  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  607  	return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  608  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  609  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  610  static int tl_rp_data_show(struct seq_file *s, void *unused)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  611  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  612  	struct adf_accel_dev *accel_dev = s->private;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  613  	u8 rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  614  	u8 max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  615  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  616  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  617  	if (!accel_dev)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  618  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  619  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  620  	max_rp = GET_TL_DATA(accel_dev).max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  621  	ret = get_rp_index_from_file(s->file, &rp_regs_index, max_rp);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  622  	if (ret) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  623  		dev_dbg(&GET_DEV(accel_dev), "invalid RP data file name\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  624  		return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  625  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  626  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  627  	return tl_print_rp_data(accel_dev, s, rp_regs_index);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  628  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  629  
355c93ad4395aa Jens Axboe              2024-04-10 @630  static ssize_t tl_rp_data_write_iter(struct kiocb *iocb, struct iov_iter *from)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  631  {
355c93ad4395aa Jens Axboe              2024-04-10  632  	struct seq_file *seq_f = iocb->ki_filp->private_data;
355c93ad4395aa Jens Axboe              2024-04-10  633  	size_t count = iov_iter_count(from);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  634  	struct adf_accel_dev *accel_dev;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  635  	struct adf_telemetry *telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  636  	unsigned int new_rp_num;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  637  	u8 rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  638  	u8 max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  639  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  640  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  641  	accel_dev = seq_f->private;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  642  	if (!accel_dev)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  643  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  644  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  645  	telemetry = accel_dev->telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  646  	max_rp = GET_TL_DATA(accel_dev).max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  647  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  648  	mutex_lock(&telemetry->wr_lock);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  649  
355c93ad4395aa Jens Axboe              2024-04-10  650  	ret = get_rp_index_from_file(iocb->ki_filp, &rp_regs_index, max_rp);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  651  	if (ret) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  652  		dev_dbg(&GET_DEV(accel_dev), "invalid RP data file name\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  653  		goto unlock_and_exit;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  654  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  655  
355c93ad4395aa Jens Axboe              2024-04-10  656  	ret = kstrtou32_from_iter(from, count, 10, &new_rp_num);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  657  	if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  658  		goto unlock_and_exit;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  659  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  660  	ret = adf_tl_dbg_change_rp_index(accel_dev, new_rp_num, rp_regs_index);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  661  	if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  662  		goto unlock_and_exit;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  663  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  664  	ret = count;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  665  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  666  unlock_and_exit:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  667  	mutex_unlock(&telemetry->wr_lock);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  668  	return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  669  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22 @670  DEFINE_SHOW_STORE_ATTRIBUTE(tl_rp_data);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  671  

:::::: The code at line 474 was first introduced by commit
:::::: 69e7649f7cc2aaa7889174456d39319a623c1a18 crypto: qat - add support for device telemetry

:::::: TO: Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
