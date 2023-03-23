Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD43C04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679597689; x=1711133689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZS26L8aamMyNfS5Xt9oIc7EuWLV2p5tLkf01x5/+2Q=;
  b=P3PoYpDc3L6M1WTamcncq0T22dg0rJjuoEIhj+J+3YobTSa/7o3p0uQG
   FM8zbdgveOp56WuWMIYDy6e+dSQKEyKvFX+JUtWSZBhQFWY6zq4hkZ/J0
   zMfoP6vxULJxQQcLGI6YjD+QQQs1rRHGlSvAtnNUlYmyYnWUqVe9R6/eI
   JhEwrSuPJwecFMU7Ty+87Lih6XqdSPDvK34PICDDHBj40EmU7/iA/dy+y
   WtGtItSgT7IYmQEkiTD9gyGk9IabauvR5PkCi25ixV/cVQr9NQVRcDk4F
   C5chC89dwQ6nBR/sxqXUEPIb7VLPH020gkPz+yEpcTMq6NmehO1LNzWOH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367331774"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367331774"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 11:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712781196"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="712781196"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 11:54:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfQ59-000Edc-0l;
	Thu, 23 Mar 2023 18:54:39 +0000
Date: Fri, 24 Mar 2023 02:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 20/20]
 drivers/nvme/target/tcp.c:1155:16: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202303240212.slier6vf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: 5c13b43fa2c503188a6d668b0dec6a22078329a2 [20/20] nvmet-tcp: peek icreq before starting TLS
config: openrisc-randconfig-s042-20230319 (https://download.01.org/0day-ci/archive/20230324/202303240212.slier6vf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=5c13b43fa2c503188a6d668b0dec6a22078329a2
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 5c13b43fa2c503188a6d668b0dec6a22078329a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240212.slier6vf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/tcp.c:1155:16: sparse: sparse: restricted __le32 degrades to integer

vim +1155 drivers/nvme/target/tcp.c

  1107	
  1108	static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue)
  1109	{
  1110		struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
  1111		int len;
  1112		struct kvec iov = {
  1113			.iov_base = (u8 *)&queue->pdu + queue->offset,
  1114			.iov_len = sizeof(struct nvme_tcp_hdr),
  1115		};
  1116		char cbuf[CMSG_LEN(sizeof(char))] = {};
  1117		unsigned char ctype;
  1118		struct cmsghdr *cmsg;
  1119		struct msghdr msg = {
  1120			.msg_control = cbuf,
  1121			.msg_controllen = sizeof(cbuf),
  1122			.msg_flags = MSG_PEEK,
  1123		};
  1124	
  1125		len = kernel_recvmsg(queue->sock, &msg, &iov, 1,
  1126				iov.iov_len, msg.msg_flags);
  1127		if (unlikely(len < 0)) {
  1128			pr_debug("queue %d peek error %d\n",
  1129				 queue->idx, len);
  1130			return len;
  1131		}
  1132	
  1133		cmsg = (struct cmsghdr *)cbuf;
  1134		if (CMSG_OK(&msg, cmsg) &&
  1135		    cmsg->cmsg_level == SOL_TLS &&
  1136		    cmsg->cmsg_type == TLS_GET_RECORD_TYPE) {
  1137			ctype = *((unsigned char *)CMSG_DATA(cmsg));
  1138			if (ctype != TLS_RECORD_TYPE_DATA) {
  1139				pr_err("queue %d unhandled TLS record %d\n",
  1140					queue->idx, ctype);
  1141				return -ENOTCONN;
  1142			}
  1143		}
  1144	
  1145		if (len < sizeof(struct nvme_tcp_hdr)) {
  1146			pr_debug("queue %d short read, %d bytes missing\n",
  1147				 queue->idx, (int)iov.iov_len - len);
  1148			return -EAGAIN;
  1149		}
  1150		pr_debug("queue %d hdr type %d hlen %d plen %d size %d\n",
  1151			 queue->idx, hdr->type, hdr->hlen, hdr->plen,
  1152			 (int)sizeof(struct nvme_tcp_icreq_pdu));
  1153		if (hdr->type == nvme_tcp_icreq &&
  1154		    hdr->hlen == sizeof(struct nvme_tcp_icreq_pdu) &&
> 1155		    hdr->plen == sizeof(struct nvme_tcp_icreq_pdu)) {
  1156			pr_debug("queue %d icreq detected\n",
  1157				 queue->idx);
  1158			return len;
  1159		}
  1160		return 0;
  1161	}
  1162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
