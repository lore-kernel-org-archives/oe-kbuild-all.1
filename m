Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC23BBEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721258160; cv=none; b=BV4VyF3GBHrLYzGaGn3eHuaci2qncoh0GsAHM6q5OVVW0VE/soyAfSXiKHLzaSaKngzj/SKt/xUlNRMVp9vHa8UL+vY4kKibOl/62BbB//UtczZQrPhivJWWwTERWhlSVn09qjRxtzbt9NCs5+4ZYQJ9NROHrsI7RUDNBge8370=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721258160; c=relaxed/simple;
	bh=ayp6OgwTIQpiZVV0t0RnLz2zfpf7HJu8YDhRI7I9i8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sd0wdL+EAUjerYIhQ6mNLJvxf4TsklmuJsmyamxlUnEHPItmWCS9OhNDftOzR4p2hcQA803po+hYlOImCH+XmRQNM1CQ+AaXyiU5FtCwCCX/hfWJM1Mw2AWqPJ9RZ6urcsVmcoBV1Zjvj0+Kr8Fx04XrpBOdV5scu9MjNELrsLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPly/n5z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPly/n5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721258158; x=1752794158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayp6OgwTIQpiZVV0t0RnLz2zfpf7HJu8YDhRI7I9i8I=;
  b=NPly/n5zoA3nkyL0IkyBF7EiYViaAneHSFXtMxf7LJkGRvLQvpGW64tZ
   unDggLZnw24hRRMp9reDEIjdnbCViPzfSfusG8euCuVI/YGTIc9Z+p0fc
   KoiKLsXDWNmGDUyXUacMN8Lj2U2PGlZF5vPfp6TAyscJ7b/aO1sR6yyT0
   FxVwLG2y5A/zyG7Nwkc9pvdcYK6HOjQIn5lK6guiobp7uJBWV3++yQ+8p
   cbYNWFqJ2lXIF0d67UwoEAf1GIJpdG3q9iZWALcY9H+IUh5TKLgS11pP+
   i9Xz/XHgJMgHOR9FCHtI2YVvFeg3Ot9iYmE0lOokHr9ppzjrvA7YaJ48u
   w==;
X-CSE-ConnectionGUID: H93N3Tb9RSy+q/dpqA3nyQ==
X-CSE-MsgGUID: TctMPDceRnmH67Fe6Q7usg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18416238"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18416238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 16:15:57 -0700
X-CSE-ConnectionGUID: cvyGiAnQTyGgbrZ6EywI5A==
X-CSE-MsgGUID: tSYMt0MlQw2HGdWnbs1s/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50611877"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2024 16:15:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUDsH-000gkc-2Z;
	Wed, 17 Jul 2024 23:15:53 +0000
Date: Thu, 18 Jul 2024 07:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v5 16/16]
 drivers/nvme/target/tcp.c:1606:27: error: 'struct nvmet_sq' has no member
 named 'tls_key'
Message-ID: <202407180928.dXavIUaJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v5
head:   4d58e409712027c1084413a8c31e93af4d148650
commit: 4d58e409712027c1084413a8c31e93af4d148650 [16/16] nvmet-tcp: support secure channel concatenation
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240718/202407180928.dXavIUaJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180928.dXavIUaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180928.dXavIUaJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/target/tcp.c:13:
   include/linux/nvme-keyring.h: In function 'nvme_tls_psk_refresh':
   include/linux/nvme-keyring.h:23:16: error: returning 'int' from a function with return type 'struct key *' makes pointer from integer without a cast [-Wint-conversion]
      23 |         return -ENOTSUPP;
         |                ^
   drivers/nvme/target/tcp.c: In function 'nvmet_tcp_release_queue_work':
>> drivers/nvme/target/tcp.c:1606:27: error: 'struct nvmet_sq' has no member named 'tls_key'
    1606 |         if (queue->nvme_sq.tls_key)
         |                           ^
   drivers/nvme/target/tcp.c:1607:39: error: 'struct nvmet_sq' has no member named 'tls_key'
    1607 |                 key_put(queue->nvme_sq.tls_key);
         |                                       ^
   include/linux/nvme-keyring.h: At top level:
   include/linux/nvme-keyring.h:20:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      20 | static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +1606 drivers/nvme/target/tcp.c

  1590	
  1591	static void nvmet_tcp_release_queue_work(struct work_struct *w)
  1592	{
  1593		struct nvmet_tcp_queue *queue =
  1594			container_of(w, struct nvmet_tcp_queue, release_work);
  1595	
  1596		mutex_lock(&nvmet_tcp_queue_mutex);
  1597		list_del_init(&queue->queue_list);
  1598		mutex_unlock(&nvmet_tcp_queue_mutex);
  1599	
  1600		nvmet_tcp_restore_socket_callbacks(queue);
  1601		cancel_delayed_work_sync(&queue->tls_handshake_tmo_work);
  1602		cancel_work_sync(&queue->io_work);
  1603		/* stop accepting incoming data */
  1604		queue->rcv_state = NVMET_TCP_RECV_ERR;
  1605	
> 1606		if (queue->nvme_sq.tls_key)
  1607			key_put(queue->nvme_sq.tls_key);
  1608	
  1609		nvmet_tcp_uninit_data_in_cmds(queue);
  1610		nvmet_sq_destroy(&queue->nvme_sq);
  1611		cancel_work_sync(&queue->io_work);
  1612		nvmet_tcp_free_cmd_data_in_buffers(queue);
  1613		/* ->sock will be released by fput() */
  1614		fput(queue->sock->file);
  1615		nvmet_tcp_free_cmds(queue);
  1616		if (queue->hdr_digest || queue->data_digest)
  1617			nvmet_tcp_free_crypto(queue);
  1618		ida_free(&nvmet_tcp_queue_ida, queue->idx);
  1619		page_frag_cache_drain(&queue->pf_cache);
  1620		kfree(queue);
  1621	}
  1622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
