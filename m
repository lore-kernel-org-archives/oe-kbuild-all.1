Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34891CB335
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727799989; cv=none; b=ovJsymxfNPwdyorG5xKVNBA4arl5B4KH6xJ6V82vGSf9TxJIYD0Ayxo34i8WUDBJZDCeXVx371vtYW81s+adjOA/FYw/W4pWOzoFQ1HWeGpoKv53Yb0BYkHeOgNhmAqs+9aUDxBFNwO2DpfQn9OvZavDw3NGEUYmSRHgYTnb9tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727799989; c=relaxed/simple;
	bh=rsIJZ2r10ZFB15kbxbat705Ej6zLlSdlydiXh7GpU3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/rMU+IqvzO0zsMo6DZ90AqxtTq6bvh/mt4oQYUABL+NjqiHaJRe8mVETK/SwqAW6FEdmhG4TLQvnXjxE4IV0ZCPxinbYwsFquSMxd1wVovtZUkqqlKsxQVhbGuuGqab5bV3oqHWbHishpahZFCTDltTpqVa1Bjhyd0JkLyXhtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2I2WZn/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2I2WZn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727799987; x=1759335987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsIJZ2r10ZFB15kbxbat705Ej6zLlSdlydiXh7GpU3g=;
  b=i2I2WZn/vV661V19LuNOPQ63hOtus5QgnFgNWlH7j/QiqJZyCCUAf9q6
   ndF7mSSvRKALbenzZB7S/PuEV8RY4M1aZFD7Mwt1dJEzqIRh0sJ940Gs1
   MicWyDuLpcqk3san5eb+aE85SNlC9Z8DW0mtxC1g/D7n8eXUSIA55Wpl2
   pSIwPibgKOm6TnyRSJpEqxCWMJMcoadcR1RRjrDT5gwH6OGnGcq5cVZVZ
   AwPP8sd+nIqRES4VUrjWerb1hOBCsDr4p/cHnGmCPHAGPa2uJg+uApEcW
   K4K3255+f/TmpJnzqt2iPlxK3iN/oNHhifbSpJmsCXTI582EtGa42d/dU
   g==;
X-CSE-ConnectionGUID: GR/ZlLYNSL+64ojsKfUTtA==
X-CSE-MsgGUID: Udzuw8YqSXeizj4FZXJ7wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30832474"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30832474"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 09:26:26 -0700
X-CSE-ConnectionGUID: 5CJQQc1lQ2Crq5fcROxqAQ==
X-CSE-MsgGUID: +rLr72NXREyY+dsxTWgNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="78135505"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2024 09:26:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svfhf-000Qsv-1H;
	Tue, 01 Oct 2024 16:26:23 +0000
Date: Wed, 2 Oct 2024 00:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2679/16788]
 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:791:5: warning:
 no previous prototype for 'tpd_i2c_read_data'
Message-ID: <202410020028.f5UPAVzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 22235f495381456c9bf47cf578668f54f41d0751 [2679/16788] MLK-17829 touchscreen: Add synaptics_dsx S3508 i2c touch driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410020028.f5UPAVzc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020028.f5UPAVzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020028.f5UPAVzc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:791:5: warning: no previous prototype for 'tpd_i2c_read_data' [-Wmissing-prototypes]
     791 | int tpd_i2c_read_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:910:5: warning: no previous prototype for 'tpd_i2c_write_data' [-Wmissing-prototypes]
     910 | int tpd_i2c_write_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
         |     ^~~~~~~~~~~~~~~~~~
--
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:3036: warning: Function parameter or member 'work' not described in 'synaptics_rmi4_exp_fn_work'
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:3084: warning: Function parameter or member 'exp_fn' not described in 'synaptics_rmi4_new_function'
>> drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c:3084: warning: Function parameter or member 'insert' not described in 'synaptics_rmi4_new_function'


vim +/tpd_i2c_read_data +791 drivers/input/touchscreen/synaptics_dsx/synaptics_dsx_i2c.c

   789	
   790	
 > 791	int tpd_i2c_read_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
   792				   unsigned short addr, unsigned char *data, unsigned short length)
   793	{
   794	
   795		unsigned char retry = 0;
   796		unsigned char *pData = data;
   797		unsigned char tmp_addr = (unsigned char)addr;
   798		int retval = 0;
   799		int left_len = length;
   800	
   801		/* u16 old_flag; */
   802		mutex_lock(&(rmi4_data->rmi4_io_ctrl_mutex));
   803	
   804		retval = tpd_set_page(rmi4_data, addr);
   805		if (retval != PAGE_SELECT_LEN) {
   806			retval = -EIO;
   807			goto exit;
   808		}
   809	
   810		retval = i2c_master_send(client, &tmp_addr, 1);
   811		while (left_len > 0) {
   812			for (retry = 0; retry < SYN_I2C_RETRY_TIMES; retry++) {
   813				if (left_len > 8)
   814					retval = i2c_master_recv(client, pData, 8);
   815				else
   816					retval = i2c_master_recv(client, pData, left_len);
   817				if (retval <= 0) {
   818					dev_err(&client->dev, "%s: I2C retry %d\n", __func__, retry + 1);
   819					msleep(20);
   820					if (retry == (SYN_I2C_RETRY_TIMES / 2)) {
   821						if (client->addr == rmi4_data->i2c_addr)
   822							client->addr = UBL_I2C_ADDR;
   823						else
   824							client->addr = rmi4_data->i2c_addr;
   825					}
   826					left_len = length;
   827					pData = data;
   828					retval = i2c_master_send(client, &tmp_addr, 1);
   829					continue;
   830				} else {
   831					break;
   832				}
   833			}
   834			if (retry == SYN_I2C_RETRY_TIMES) {
   835				retval = -EIO;
   836				goto exit;
   837			}
   838			left_len -= 8;
   839			pData += 8;
   840		}
   841	exit:
   842		 mutex_unlock(&(rmi4_data->rmi4_io_ctrl_mutex));
   843	
   844		return retval;
   845	}
   846	EXPORT_SYMBOL(tpd_i2c_read_data);
   847	
   848	#ifdef USE_I2C_DMA
   849	int tpd_i2c_write_data_dma(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
   850					unsigned short addr, unsigned char *data, unsigned short length)
   851	{
   852		int retval = 0;
   853		unsigned char retry;
   854		unsigned char *buf_va = NULL;
   855		struct i2c_msg msg[1];
   856	
   857		mutex_lock(&(rmi4_data->rmi4_io_ctrl_mutex));
   858	
   859		msg[0].addr = rmi4_data->i2c_client->addr;
   860		msg[0].flags = 0;
   861		msg[0].len = length + 1;
   862		msg[0].ext_flag = (rmi4_data->i2c_client->ext_flag | I2C_ENEXT_FLAG | I2C_DMA_FLAG),
   863		msg[0].buf = (unsigned char *)(uintptr_t)wDMABuf_pa;
   864		msg[0].timing = 400;
   865	
   866		retval = tpd_set_page(rmi4_data, addr);
   867		if (retval != PAGE_SELECT_LEN) {
   868			retval = -EIO;
   869			goto exit;
   870		}
   871	
   872		buf_va = wDMABuf_va;
   873		buf_va[0] = addr & MASK_8BIT;
   874		memcpy(&buf_va[1], &data[0], length);
   875	
   876		for (retry = 0; retry < SYN_I2C_RETRY_TIMES; retry++) {
   877			if (i2c_transfer(rmi4_data->i2c_client->adapter, msg, 1) == 1) {
   878				retval = length;
   879				break;
   880			}
   881			dev_err(&rmi4_data->i2c_client->dev,
   882					"%s: I2C retry %d\n",
   883					__func__, retry + 1);
   884			msleep(20);
   885	
   886			if (retry == (SYN_I2C_RETRY_TIMES / 2)) {
   887				if (rmi4_data->i2c_client->addr == rmi4_data->i2c_addr)
   888					rmi4_data->i2c_client->addr = UBL_I2C_ADDR;
   889				else
   890					rmi4_data->i2c_client->addr = rmi4_data->i2c_addr;
   891				msg[0].addr = rmi4_data->i2c_client->addr;
   892			}
   893		}
   894	
   895		if (retry == SYN_I2C_RETRY_TIMES) {
   896			dev_err(&rmi4_data->i2c_client->dev,
   897					"%s: I2C write over retry limit\n",
   898					__func__);
   899			retval = -EIO;
   900		}
   901	
   902	exit:
   903		mutex_unlock(&(rmi4_data->rmi4_io_ctrl_mutex));
   904	
   905		return retval;
   906	}
   907	EXPORT_SYMBOL(tpd_i2c_write_data_dma);
   908	
   909	#else
 > 910	int tpd_i2c_write_data(struct synaptics_rmi4_data *rmi4_data, struct i2c_client *client,
   911					unsigned short addr, unsigned char *data, unsigned short length)
   912	{
   913		int retval = 0;
   914		u8 retry = 0;
   915		u8 *buf;
   916		int tmp_addr = addr;
   917	
   918	
   919		mutex_lock(&(rmi4_data->rmi4_io_ctrl_mutex));
   920	
   921		retval = tpd_set_page(rmi4_data, addr);
   922		if (retval != PAGE_SELECT_LEN) {
   923			pr_err("tpd_set_page fail, retval = %d\n", retval);
   924			retval = -EIO;
   925			goto exit;
   926		}
   927	
   928		buf = kzalloc(sizeof(unsigned char) * (length + 1), GFP_KERNEL);
   929		*buf = tmp_addr;
   930		memcpy(buf + 1, data, length);
   931		for (retry = 0; retry < SYN_I2C_RETRY_TIMES; retry++) {
   932			retval = i2c_master_send(client, buf, (length + 1));
   933			if (retval <= 0) {
   934				dev_err(&client->dev, "%s: I2C retry %d\n", __func__, retry + 1);
   935				msleep(20);
   936				continue;
   937			} else {
   938				break;
   939			}
   940		}
   941		kfree(buf);
   942	
   943	exit:
   944		mutex_unlock(&(rmi4_data->rmi4_io_ctrl_mutex));
   945	
   946		return retval;
   947	}
   948	EXPORT_SYMBOL(tpd_i2c_write_data);
   949	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
