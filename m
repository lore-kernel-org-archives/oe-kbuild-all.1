Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F37C1FF1B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737118846; cv=none; b=Wx+rsjAazv+qkVNk/Wp4mtPu8m0XjGUENN0u4tYvZP11C0Z4+FnAHUafweB3FDsgnEeUWvESW3479Bbfi5VZEQOPOxmN8bNvDeZ37/4fGu631yx/8SYuKMrx1t784js1/wnNOl38tvHrNNdmzGak2dKIPUSfIAbu5EJmeW8+9t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737118846; c=relaxed/simple;
	bh=RWMds6hiuith10kRT5ueUlKRgFZdOuKfwqX/EupybVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXlwS4vPkpCa3LaCptR3/bal/jWFwiJTz9t4n8uWmvWR1yI80Vi9+cSSoTkzxDWyPCmxAmvtbqw2p/r2iUgRI7urtUBLs7Ww4JDKy4ULA88UYTcJO88AL/LgeXGTVERrHVzYelCvGu9OdsbqpLQhWfqd5SqXs9AHx5CL5Rkk6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGXOdHsa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGXOdHsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737118845; x=1768654845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWMds6hiuith10kRT5ueUlKRgFZdOuKfwqX/EupybVQ=;
  b=CGXOdHsaqv45DlMXSR/BEpYzPr/Fvg+Vvx5HwrnBHro4xtgVq4wnwx/c
   A89dTPAQIBX82f+7lzTx99kxrYHmcgvbWS2qpnqtEvBK6qt2XWDtwETCY
   9F53+kn600xM3ZxbTD6QIsfKO/zXoYRdtWEqFSOXRVgQr48IwxoJsVi9j
   CRrMnFeroURYoX3rAOmddtyU5u4F3GxzixrOoSVvmReiUrWTVPVvXobMs
   7jEDE2zi4bLud5Hyd2LMlRAWpA4wcwX/HRTR6uYGKKIDTQUdJtZ8W6uU1
   TwcjUvAFjOPc3e1AWYu4XNVT7HgoGt7rep6nwKolzhiXTQVxOU8Oy5hB4
   w==;
X-CSE-ConnectionGUID: 4vghf9R2RgeMjTc5JJmibg==
X-CSE-MsgGUID: fW+oziyZQOK5vfebIL+uhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37242071"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37242071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:00:42 -0800
X-CSE-ConnectionGUID: FzfzpqKdTrucO14UlYeUTQ==
X-CSE-MsgGUID: TpeWauSsRnS7hU7PDkLJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110804178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 05:00:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYlxl-000TDX-2G;
	Fri, 17 Jan 2025 13:00:37 +0000
Date: Fri, 17 Jan 2025 21:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 3/23]
 drivers/firmware/arm_ffa/driver.c:1282:7-14: WARNING opportunity for kmemdup
Message-ID: <202501172022.oicUGCNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   2e3356784e87f20c8375b12adebc1e706091c1c8
commit: c92b9202ffe8dca2c24ebc943f52ed20d4a8dafc [3/23] firmware: arm_ffa: Add support for framework notifications
config: arm64-randconfig-r053-20250117 (https://download.01.org/0day-ci/archive/20250117/202501172022.oicUGCNf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172022.oicUGCNf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/driver.c:1282:7-14: WARNING opportunity for kmemdup

vim +1282 drivers/firmware/arm_ffa/driver.c

  1267	
  1268	static void handle_framework_notif_callbacks(u64 bitmap)
  1269	{
  1270		int notify_id = 0, recv_vm_id;
  1271		struct ffa_indirect_msg_hdr *msg, *buf;
  1272		struct notifier_cb_info *cb_info = NULL;
  1273	
  1274		/* Only one framework notification defined and supported */
  1275		if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
  1276			return;
  1277	
  1278		mutex_lock(&drv_info->rx_lock);
  1279	
  1280		msg = drv_info->rx_buffer;
  1281		recv_vm_id = RECEIVER_ID(msg->send_recv_id);
> 1282		buf = kmalloc(sizeof(*buf) + msg->size, GFP_KERNEL);
  1283		if (!buf) {
  1284			mutex_unlock(&drv_info->rx_lock);
  1285			return;
  1286		}
  1287		memcpy(buf, msg + msg->offset, sizeof(*buf) + msg->size);
  1288		buf->offset = sizeof(*buf);
  1289		mutex_unlock(&drv_info->rx_lock);
  1290	
  1291		ffa_rx_release();
  1292	
  1293		mutex_lock(&drv_info->notify_lock);
  1294		cb_info = notifier_hash_node_get(notify_id, recv_vm_id, true);
  1295		mutex_unlock(&drv_info->notify_lock);
  1296	
  1297		if (cb_info && cb_info->cb)
  1298			cb_info->cb(notify_id, buf);
  1299		kfree(buf);
  1300	}
  1301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
