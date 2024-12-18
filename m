Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58614B075
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734504377; cv=none; b=ebWa2HoemBo4Txs1Z4tiAXv+F/KHItpHkBPmejuzwQVFfcY/MuetmrUafoL7bhiVx5ixKmxSlf5NgWhzyWP1nOuvFYWiZDHikG9mLqdU1nSbvwPhRY9CDioYmmd6m3o/+06irPrbOhw/MDpYQZ9AaM5uUaRETXvI+Rt1ZxTst3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734504377; c=relaxed/simple;
	bh=z4rppUxer9YW5skjpygk3b1I9A7fmlj5hnHNivQc1xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBxzYDR6vTg6acJSDyK35svz2Ht389+Opbq6/DJWRv2KV4FWu8uq/oItko0Rk2jIrmAnkDxWZQPE8Vvw0TVYmPUourgh6z7eZoqQx2prET0hnWkaL2FNxl/6SD01AHCIAdnwLJ7x+NY3oumFJITI6YzJJqJgguI5k+K2l9xLkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eILCK4hX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eILCK4hX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734504376; x=1766040376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4rppUxer9YW5skjpygk3b1I9A7fmlj5hnHNivQc1xE=;
  b=eILCK4hXOSWrNsxCiWENZeUC/i3QW7OgHujsfkGphltOmcemmEeCFXBQ
   rfgDO94rxxOj0s1hr8yLS548hxcrxUS8U57FBPx4j5qanQlf/v1XUyQAE
   YtAsd7JsyUy/V4HF9p4BZNtXu2z+pNRGv5bAw6BRHV8fe5PMP4byUpT7y
   aYWUH/6vBpPoUaTUYfaljvXB/yJSs8WbSNTqG9oBQ1QlmsxeuyVSaEHVp
   wJxmnbwQHvkJTWP53Ce1AGb5qC2bRNg21qmcm5Irp0zlpLihnuVF7VgLO
   XqN6qTSx5+PvmBc4rgDH8SiTM3GUoV4C1kiIIfzKVTV1oFbdvmoZIkaig
   Q==;
X-CSE-ConnectionGUID: sZrv/Bx8TqSucfL3aFEeZQ==
X-CSE-MsgGUID: Yqqh7mNZSKeEYQ/gPG0ASw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45564496"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45564496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:46:15 -0800
X-CSE-ConnectionGUID: +g674oocT06PcR60ZX0uDw==
X-CSE-MsgGUID: 6fXHCGQRQCKaBPn2UmkKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102382714"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 22:46:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNnox-000GA2-2G;
	Wed, 18 Dec 2024 06:46:11 +0000
Date: Wed, 18 Dec 2024 14:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] drivers/char/lsse_sdf_cdev.c:198:62:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202412181438.CJxz4kpl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: bcb311924fa97b123317ec1d4d4ccce77199c9d2 [1613/1613] LoongArch: add loongson SE SDF support
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241218/202412181438.CJxz4kpl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412181438.CJxz4kpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181438.CJxz4kpl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/lsse_sdf_cdev.c:198:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *buf @@
   drivers/char/lsse_sdf_cdev.c:198:62: sparse:     expected void const [noderef] __user *from
   drivers/char/lsse_sdf_cdev.c:198:62: sparse:     got char const *buf
>> drivers/char/lsse_sdf_cdev.c:239:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const *buf @@     got char const [noderef] __user *buf @@
   drivers/char/lsse_sdf_cdev.c:239:32: sparse:     expected char const *buf
   drivers/char/lsse_sdf_cdev.c:239:32: sparse:     got char const [noderef] __user *buf
>> drivers/char/lsse_sdf_cdev.c:248:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char *buf @@     got char [noderef] __user *buf @@
   drivers/char/lsse_sdf_cdev.c:248:50: sparse:     expected char *buf
   drivers/char/lsse_sdf_cdev.c:248:50: sparse:     got char [noderef] __user *buf
>> drivers/char/lsse_sdf_cdev.c:345:30: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct miscdevice *misc @@     got struct miscdevice const * @@
   drivers/char/lsse_sdf_cdev.c:345:30: sparse:     expected struct miscdevice *misc
   drivers/char/lsse_sdf_cdev.c:345:30: sparse:     got struct miscdevice const *
   drivers/char/lsse_sdf_cdev.c:361:26: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct miscdevice *misc @@     got struct miscdevice const * @@
   drivers/char/lsse_sdf_cdev.c:361:26: sparse:     expected struct miscdevice *misc
   drivers/char/lsse_sdf_cdev.c:361:26: sparse:     got struct miscdevice const *
   drivers/char/lsse_sdf_cdev.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:244:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/char/loongson_se.c:558:30: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct miscdevice *misc @@     got struct miscdevice const * @@
   drivers/char/loongson_se.c:558:30: sparse:     expected struct miscdevice *misc
   drivers/char/loongson_se.c:558:30: sparse:     got struct miscdevice const *
   drivers/char/loongson_se.c:581:26: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct miscdevice *misc @@     got struct miscdevice const * @@
   drivers/char/loongson_se.c:581:26: sparse:     expected struct miscdevice *misc
   drivers/char/loongson_se.c:581:26: sparse:     got struct miscdevice const *
   drivers/char/loongson_se.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:244:46: sparse: sparse: self-comparison always evaluates to false

vim +198 drivers/char/lsse_sdf_cdev.c

   170	
   171	static int lsse_sdf_send(struct sdf_file_pvt_data *pvt, const char *buf,
   172			size_t count, int user)
   173	{
   174		int ret, se_ret;
   175		struct sdf_handle *ph = NULL;
   176		struct sdf_kernel_command *skc;
   177		struct lsse_sdf_dev *se = pvt->se;
   178	
   179		if (!se->se_ch->smsg) {
   180			pr_err("se device is not ready\n");
   181			return 0;
   182		}
   183	
   184		if (count > se->se_ch->data_size) {
   185			pr_err("Invalid size in send: count=%zd, size=%d\n",
   186				count, se->se_ch->data_size);
   187			return -EIO;
   188		}
   189	
   190		if (user) {
   191			ret = mutex_lock_interruptible(&se->data_lock);
   192			if (ret)
   193				goto out;
   194		} else
   195			mutex_lock(&se->data_lock);
   196	
   197		if (user) {
 > 198			ret = copy_from_user(se->se_ch->data_buffer, buf, count);
   199			if (ret) {
   200				ret = -EFAULT;
   201				goto out_unlock;
   202			}
   203			skc = (struct sdf_kernel_command *)se->se_ch->data_buffer;
   204			if (skc->header.command == SDF_CLOSESESSION)
   205				ph = find_sdf_handle(skc->handle, pvt);
   206		} else
   207			memcpy(se->se_ch->data_buffer, buf, count);
   208	
   209		se->processing_cmd = true;
   210		ret = se_send_sdf_cmd(se, count, 5);
   211		if (ret) {
   212			pr_err("se_send_sdf_cmd failed\n");
   213			goto out_unlock;
   214		}
   215	
   216		ret = lsse_sdf_recv(pvt, (char *)buf, 0, user, &se_ret);
   217		if (ret) {
   218			pr_err("recv failed ret: %x\n", ret);
   219			goto out_unlock;
   220		}
   221		if (ph && !se_ret) {
   222			list_del(&ph->handle_list);
   223			kfree(ph);
   224		}
   225	out_unlock:
   226		mutex_unlock(&se->data_lock);
   227	out:
   228		return ret;
   229	}
   230	
   231	static ssize_t lsse_sdf_write(struct file *filp, const char __user *buf,
   232			size_t cnt, loff_t *offt)
   233	{
   234		struct sdf_file_pvt_data *pvt = filp->private_data;
   235	
   236		if (cnt > SE_SDF_BUFSIZE)
   237			return -E2BIG;
   238	
 > 239		if (lsse_sdf_send(pvt, buf, cnt, 1))
   240			return -EFAULT;
   241	
   242		return cnt;
   243	}
   244	
   245	static ssize_t lsse_sdf_read(struct file *filp, char __user *buf,
   246				size_t size, loff_t *off)
   247	{
 > 248		return lsse_sdf_recv(filp->private_data, buf, size, 1, NULL);
   249	}
   250	
   251	static int close_one_handle(struct sdf_file_pvt_data *pvt, struct sdf_handle *ph)
   252	{
   253		struct sdf_kernel_command *skc = &pvt->skc;
   254	
   255		skc->header.command = 0x205;
   256		skc->header.u.param_cnt = 1;
   257		skc->header.param_len[0] = 8;
   258		skc->handle = ph->handle;
   259		/* close one session */
   260		lsse_sdf_send(pvt, (char *)&pvt->skc, KERNEL_COMMAND_SIZE, 0);
   261		if (skc->header.u.ret) {
   262			pr_err("Auto Close Session failed, session handle: %llx, ret: %d\n",
   263					(u64)ph->handle, skc->header.u.ret);
   264			return skc->header.u.ret;
   265		}
   266		kfree(ph);
   267	
   268		return 0;
   269	}
   270	
   271	static int close_all_handle(struct sdf_file_pvt_data *pvt)
   272	{
   273		int ret = 0;
   274		struct sdf_handle *ph, *tmp;
   275	
   276		list_for_each_entry_safe(ph, tmp, &pvt->handle_list, handle_list) {
   277			list_del(&ph->handle_list);
   278			ret = close_one_handle(pvt, ph);
   279			if (ret)
   280				return ret;
   281		}
   282	
   283		return 0;
   284	}
   285	
   286	static int lsse_sdf_release(struct inode *inode, struct file *filp)
   287	{
   288		int ret;
   289		struct sdf_file_pvt_data *pvt = filp->private_data;
   290	
   291		ret = close_all_handle(pvt);
   292		filp->private_data = NULL;
   293		kfree(pvt);
   294	
   295		if (ret)
   296			ret = -EFAULT;
   297		return ret;
   298	}
   299	
   300	static int lsse_sdf_open(struct inode *inode, struct file *filp)
   301	{
   302		struct sdf_file_pvt_data *pvt = kmalloc(sizeof(*pvt), GFP_KERNEL);
   303	
   304		if (!pvt)
   305			return -ENOMEM;
   306	
   307		INIT_LIST_HEAD(&pvt->handle_list);
   308		pvt->se = se_sdf_dev;
   309		filp->private_data = pvt;
   310	
   311		return 0;
   312	}
   313	
   314	static const struct file_operations lsse_sdf_fops = {
   315		.owner = THIS_MODULE,
   316		.open = lsse_sdf_open,
   317		.write = lsse_sdf_write,
   318		.read = lsse_sdf_read,
   319		.release = lsse_sdf_release,
   320	};
   321	
   322	static const struct miscdevice lsse_sdf_miscdev = {
   323		.minor = MISC_DYNAMIC_MINOR,
   324		.name = "lsse_sdf",
   325		.fops = &lsse_sdf_fops,
   326	};
   327	
   328	static int lsse_sdf_probe(struct platform_device *pdev)
   329	{
   330		int msg_size;
   331		int ret;
   332	
   333		se_sdf_dev = kzalloc(sizeof(*se_sdf_dev), GFP_KERNEL);
   334		if (IS_ERR_OR_NULL(se_sdf_dev))
   335			return PTR_ERR(se_sdf_dev);
   336	
   337		mutex_init(&se_sdf_dev->data_lock);
   338		init_waitqueue_head(&se_sdf_dev->wq);
   339		se_sdf_dev->processing_cmd = false;
   340	
   341		msg_size = 2 * sizeof(struct se_sdf_msg);
   342		se_sdf_dev->se_ch = se_init_ch(SE_CH_SDF, SE_SDF_BUFSIZE, msg_size,
   343				se_sdf_dev, lsse_sdf_complete);
   344	
 > 345		ret = misc_register(&lsse_sdf_miscdev);
   346		if (ret < 0) {
   347			pr_err("register sdf dev failed!\n");
   348			goto out;
   349		}
   350	
   351		return 0;
   352	
   353	out:
   354		kfree(se_sdf_dev);
   355	
   356		return ret;
   357	}
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
