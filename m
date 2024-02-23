Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DFC111B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708672270; cv=none; b=mpwNcyBgJD7/gXfEA4bUIq7UssCYyk3Zxf6UvRIzn/+7nfE/3NB5kvD+jp0zy/21FPf8wOb21vqiIbIIgmT5dPnJg7NhKTLCAHuYPPgos4eqUnb4iisVmIjD8YgSdK7nOdZBz3E2B35OxSFK91n188R3Hc28S01yN4LLoPg91R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708672270; c=relaxed/simple;
	bh=BevXAtMvLvpjYUZSODAOX20rTwcWJ3+qba1h2qEsla8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+XK8ndBdoR3RvHpURhZK/6boVFgX37PTU22qZPVHBjKK4LSJjdkZkgSCJoS/jCH76ylGgW5xOJWoF+w0UwX8CJbX/mQgS8zFcRVGibMWuM51wxJZS0mcy4B7PprvxGLEG3nsO+vuKe9XveVx9bDONhx6tpATSAaZanVSOMPB5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXn01GmI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXn01GmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708672268; x=1740208268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BevXAtMvLvpjYUZSODAOX20rTwcWJ3+qba1h2qEsla8=;
  b=EXn01GmI5ecEtD6HSa9Cwne//KaeXvNbFfoNlSpaozD1H0/vKqYVlLnm
   mPkuik1S8lRzOL/GDfvdgreIKmoh91vVc9UPO29JMYHsXGeoh/EmMOYHk
   pFDHOIS/dJLQSuZdZDMKlVCoF3lAtZgaureWU4+ZDBPqdGHoah870Yjv0
   OtvLUbV0kgKsMZ60F/SEief+i/hMuWynfXo7VCSwvW+JdFU0fv/1dfltr
   NT5QkZeEIWLBCVj2O7DmOO3zNeAvd/zZNo2vJAEuPHurlgx96ZvDxFwBS
   gVPVGWPGLLy0itaJdZ+cXtLdqRhGhWJW3ndGGeJeapDB781Zj7UGe4Czw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28404475"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28404475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 23:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28986500"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2024 23:11:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdPi1-0007BQ-0M;
	Fri, 23 Feb 2024 07:11:01 +0000
Date: Fri, 23 Feb 2024 15:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/xen-netfront.c:392:25: error: implicit declaration of
 function 'RING_COPY_RESPONSE'; did you mean 'RING_GET_RESPONSE'?
Message-ID: <202402231544.xtAQgABT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 9c133771eb287dd7f17a6683fd9061ffa6e6c3d4 xen/netfront: read response from backend only once
date:   1 year, 2 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402231544.xtAQgABT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231544.xtAQgABT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231544.xtAQgABT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/xen-netfront.c: In function 'xennet_tx_buf_gc':
>> drivers/net/xen-netfront.c:392:25: error: implicit declaration of function 'RING_COPY_RESPONSE'; did you mean 'RING_GET_RESPONSE'? [-Werror=implicit-function-declaration]
     392 |                         RING_COPY_RESPONSE(&queue->tx, cons, &txrsp);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         RING_GET_RESPONSE
   drivers/net/xen-netfront.c: In function 'store_rxbuf':
   drivers/net/xen-netfront.c:2117:23: warning: variable 'target' set but not used [-Wunused-but-set-variable]
    2117 |         unsigned long target;
         |                       ^~~~~~
   cc1: some warnings being treated as errors


vim +392 drivers/net/xen-netfront.c

   375	
   376	static void xennet_tx_buf_gc(struct netfront_queue *queue)
   377	{
   378		RING_IDX cons, prod;
   379		unsigned short id;
   380		struct sk_buff *skb;
   381		bool more_to_do;
   382	
   383		BUG_ON(!netif_carrier_ok(queue->info->netdev));
   384	
   385		do {
   386			prod = queue->tx.sring->rsp_prod;
   387			rmb(); /* Ensure we see responses up to 'rp'. */
   388	
   389			for (cons = queue->tx.rsp_cons; cons != prod; cons++) {
   390				struct xen_netif_tx_response txrsp;
   391	
 > 392				RING_COPY_RESPONSE(&queue->tx, cons, &txrsp);
   393				if (txrsp.status == XEN_NETIF_RSP_NULL)
   394					continue;
   395	
   396				id  = txrsp.id;
   397				skb = queue->tx_skbs[id].skb;
   398				if (unlikely(gnttab_query_foreign_access(
   399					queue->grant_tx_ref[id]) != 0)) {
   400					pr_alert("%s: warning -- grant still in use by backend domain\n",
   401						 __func__);
   402					BUG();
   403				}
   404				gnttab_end_foreign_access_ref(
   405					queue->grant_tx_ref[id], GNTMAP_readonly);
   406				gnttab_release_grant_reference(
   407					&queue->gref_tx_head, queue->grant_tx_ref[id]);
   408				queue->grant_tx_ref[id] = GRANT_INVALID_REF;
   409				queue->grant_tx_page[id] = NULL;
   410				add_id_to_freelist(&queue->tx_skb_freelist, queue->tx_skbs, id);
   411				dev_kfree_skb_irq(skb);
   412			}
   413	
   414			queue->tx.rsp_cons = prod;
   415	
   416			RING_FINAL_CHECK_FOR_RESPONSES(&queue->tx, more_to_do);
   417		} while (more_to_do);
   418	
   419		xennet_maybe_wake_tx(queue);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
