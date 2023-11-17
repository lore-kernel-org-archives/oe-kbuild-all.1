Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F15DDC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 07:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4Ddyuhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700205867; x=1731741867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3QTQ1rZIxjRUYi3VC+lZ8Zt2PyYBOafeLa96dpSVEGo=;
  b=N4DdyuhrP1zSLfAkYWjwB0D89QUd1qiZrPBoH8L1Bm1NpEzrZWEB7aQt
   HCeB+Egmi0365q1xuE1OvvXyP3wjnigjIcx7OMMUzpnAC+AYPZ7gqjUCi
   xe61YGUG46ZmjExXH3zD7xx9hb/RdkdqJYr7ge1hrrzyyt6k150VOc++I
   uk+F/LUhvz5sUI61sQ3jPVq5MRSCw+9XOcCSBw82JIE+9AP3IK/DISXHg
   9cgliffVBqL6qsis1qw0OEg/wxb7zmRZQdFez9ZXa2TeuLVB61I1GQ2Vl
   gp9HQsGVMihr+JL7dUePiYSpG3OlhfHxjlGcugdJo97EjOX1+4S+Ji4nW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455548190"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="455548190"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 23:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="856258580"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="856258580"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2023 23:24:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3tDC-0002SQ-2F;
	Fri, 17 Nov 2023 07:24:22 +0000
Date: Fri, 17 Nov 2023 15:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: xiubli@redhat.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ceph: update the oldest_client_tid via the renew caps
Message-ID: <202311171542.otAUXHyG-lkp@intel.com>
References: <20231116071338.678918-3-xiubli@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116071338.678918-3-xiubli@redhat.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ceph-client/for-linus]
[also build test WARNING on linus/master v6.7-rc1 next-20231117]
[cannot apply to ceph-client/testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xiubli-redhat-com/ceph-rename-create_session_open_msg-to-create_session_full_msg/20231116-151746
base:   https://github.com/ceph/ceph-client.git for-linus
patch link:    https://lore.kernel.org/r/20231116071338.678918-3-xiubli%40redhat.com
patch subject: [PATCH 2/2] ceph: update the oldest_client_tid via the renew caps
config: i386-randconfig-063-20231117 (https://download.01.org/0day-ci/archive/20231117/202311171542.otAUXHyG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311171542.otAUXHyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311171542.otAUXHyG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/mds_client.c:1648:28: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long long [usertype] v @@     got restricted __le64 [usertype] @@
   fs/ceph/mds_client.c:1648:28: sparse:     expected unsigned long long [usertype] v
   fs/ceph/mds_client.c:1648:28: sparse:     got restricted __le64 [usertype]
   fs/ceph/mds_client.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1648 fs/ceph/mds_client.c

  1532	
  1533	/*
  1534	 * session message, specialization for CEPH_SESSION_REQUEST_OPEN
  1535	 * to include additional client metadata fields.
  1536	 */
  1537	static struct ceph_msg *
  1538	create_session_full_msg(struct ceph_mds_client *mdsc, int op, u64 seq)
  1539	{
  1540		struct ceph_msg *msg;
  1541		struct ceph_mds_session_head *h;
  1542		int i;
  1543		int extra_bytes = 0;
  1544		int metadata_key_count = 0;
  1545		struct ceph_options *opt = mdsc->fsc->client->options;
  1546		struct ceph_mount_options *fsopt = mdsc->fsc->mount_options;
  1547		struct ceph_client *cl = mdsc->fsc->client;
  1548		size_t size, count;
  1549		void *p, *end;
  1550		int ret;
  1551	
  1552		const char* metadata[][2] = {
  1553			{"hostname", mdsc->nodename},
  1554			{"kernel_version", init_utsname()->release},
  1555			{"entity_id", opt->name ? : ""},
  1556			{"root", fsopt->server_path ? : "/"},
  1557			{NULL, NULL}
  1558		};
  1559	
  1560		/* Calculate serialized length of metadata */
  1561		extra_bytes = 4;  /* map length */
  1562		for (i = 0; metadata[i][0]; ++i) {
  1563			extra_bytes += 8 + strlen(metadata[i][0]) +
  1564				strlen(metadata[i][1]);
  1565			metadata_key_count++;
  1566		}
  1567	
  1568		/* supported feature */
  1569		size = 0;
  1570		count = ARRAY_SIZE(feature_bits);
  1571		if (count > 0)
  1572			size = FEATURE_BYTES(count);
  1573		extra_bytes += 4 + size;
  1574	
  1575		/* metric spec */
  1576		size = 0;
  1577		count = ARRAY_SIZE(metric_bits);
  1578		if (count > 0)
  1579			size = METRIC_BYTES(count);
  1580		extra_bytes += 2 + 4 + 4 + size;
  1581	
  1582		/* flags, mds auth caps and oldest_client_tid */
  1583		extra_bytes += 4 + 4 + 8;
  1584	
  1585		/* Allocate the message */
  1586		msg = ceph_msg_new(CEPH_MSG_CLIENT_SESSION, sizeof(*h) + extra_bytes,
  1587				   GFP_NOFS, false);
  1588		if (!msg) {
  1589			pr_err_client(cl, "ENOMEM creating session open msg\n");
  1590			return ERR_PTR(-ENOMEM);
  1591		}
  1592		p = msg->front.iov_base;
  1593		end = p + msg->front.iov_len;
  1594	
  1595		h = p;
  1596		h->op = cpu_to_le32(op);
  1597		h->seq = cpu_to_le64(seq);
  1598	
  1599		/*
  1600		 * Serialize client metadata into waiting buffer space, using
  1601		 * the format that userspace expects for map<string, string>
  1602		 *
  1603		 * ClientSession messages with metadata are v7
  1604		 */
  1605		msg->hdr.version = cpu_to_le16(7);
  1606		msg->hdr.compat_version = cpu_to_le16(1);
  1607	
  1608		/* The write pointer, following the session_head structure */
  1609		p += sizeof(*h);
  1610	
  1611		/* Number of entries in the map */
  1612		ceph_encode_32(&p, metadata_key_count);
  1613	
  1614		/* Two length-prefixed strings for each entry in the map */
  1615		for (i = 0; metadata[i][0]; ++i) {
  1616			size_t const key_len = strlen(metadata[i][0]);
  1617			size_t const val_len = strlen(metadata[i][1]);
  1618	
  1619			ceph_encode_32(&p, key_len);
  1620			memcpy(p, metadata[i][0], key_len);
  1621			p += key_len;
  1622			ceph_encode_32(&p, val_len);
  1623			memcpy(p, metadata[i][1], val_len);
  1624			p += val_len;
  1625		}
  1626	
  1627		ret = encode_supported_features(&p, end);
  1628		if (ret) {
  1629			pr_err_client(cl, "encode_supported_features failed!\n");
  1630			ceph_msg_put(msg);
  1631			return ERR_PTR(ret);
  1632		}
  1633	
  1634		ret = encode_metric_spec(&p, end);
  1635		if (ret) {
  1636			pr_err_client(cl, "encode_metric_spec failed!\n");
  1637			ceph_msg_put(msg);
  1638			return ERR_PTR(ret);
  1639		}
  1640	
  1641		/* version == 5, flags */
  1642		ceph_encode_32(&p, 0);
  1643	
  1644		/* version == 6, mds auth caps */
  1645		ceph_encode_32(&p, 0);
  1646	
  1647		/* version == 7, oldest_client_tid */
> 1648		ceph_encode_64(&p, cpu_to_le64(mdsc->oldest_tid));
  1649	
  1650		msg->front.iov_len = p - msg->front.iov_base;
  1651		msg->hdr.front_len = cpu_to_le32(msg->front.iov_len);
  1652	
  1653		return msg;
  1654	}
  1655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
