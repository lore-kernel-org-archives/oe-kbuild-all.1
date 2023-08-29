Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F207E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693269635; x=1724805635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Led+nbmu72gPZtZl3lbvE0qUMbdhMr5Qt+wbXddzYSc=;
  b=QKFMxkEkP1omcta8BEVveFiKkdbYLvJWpmUNkklYKsiHizcdWDu9VsR+
   IGoxKo0LZpCtXUQdI42Hln3esarciMTZKUsSVDlM50WdzpNYCnbJao/hb
   Qr3FWkIgmzDpnbtathT09hVw9cYgVdevd/B4XJl+cN3GyambPlz0Q212v
   XLILO05Epo5OF2BvDKzVlJ2pFomfHtgVDne7dcCCqpVWSbMHlR5h3W8lf
   +8lbZsA0MyzX8NiiXyRAcGaLTVvtASQhKpEjiy8brRFFUMisGjLxDPc5M
   8fF5FxT9+fqn6+GW5U20oJEK3hWux9DRswVUySriBS3moXhbWhAoMDlRr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355568926"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="355568926"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 17:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="912215490"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="912215490"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Aug 2023 17:40:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qammW-0008Eu-0X;
	Tue, 29 Aug 2023 00:40:32 +0000
Date: Tue, 29 Aug 2023 08:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.5/zen-sauce 8/31]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:9: warning: 'memcpy'
 reading 56 bytes from a region of size 20
Message-ID: <202308290821.HUoWqeKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.5/zen-sauce
head:   bf45053c965e9b8a0b6225c5d378493b5aaf1336
commit: ee681378d069540756ec09b96ca3f855fed89b78 [8/31] ZEN: Disable stack conservation for GCC
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230829/202308290821.HUoWqeKQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290821.HUoWqeKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290821.HUoWqeKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'virtio_crypto_alg_akcipher_init_session',
       inlined from 'virtio_crypto_rsa_set_key' at drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:425:9:
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:9: warning: 'memcpy' reading 56 bytes from a region of size 20 [-Wstringop-overread]
     131 |         memcpy(&ctrl->u, para, sizeof(ctrl->u));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c: In function 'virtio_crypto_rsa_set_key':
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:375:52: note: source object 'para' of size 20
     375 |         struct virtio_crypto_akcipher_session_para para;
         |                                                    ^~~~


vim +/memcpy +131 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

59ca6c93387d32 zhenwei pi         2022-03-02  105  
59ca6c93387d32 zhenwei pi         2022-03-02  106  static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher_ctx *ctx,
59ca6c93387d32 zhenwei pi         2022-03-02  107  		struct virtio_crypto_ctrl_header *header, void *para,
59ca6c93387d32 zhenwei pi         2022-03-02  108  		const uint8_t *key, unsigned int keylen)
59ca6c93387d32 zhenwei pi         2022-03-02  109  {
59ca6c93387d32 zhenwei pi         2022-03-02  110  	struct scatterlist outhdr_sg, key_sg, inhdr_sg, *sgs[3];
59ca6c93387d32 zhenwei pi         2022-03-02  111  	struct virtio_crypto *vcrypto = ctx->vcrypto;
59ca6c93387d32 zhenwei pi         2022-03-02  112  	uint8_t *pkey;
59ca6c93387d32 zhenwei pi         2022-03-02  113  	int err;
59ca6c93387d32 zhenwei pi         2022-03-02  114  	unsigned int num_out = 0, num_in = 0;
6fd763d155860e zhenwei pi         2022-05-06  115  	struct virtio_crypto_op_ctrl_req *ctrl;
6fd763d155860e zhenwei pi         2022-05-06  116  	struct virtio_crypto_session_input *input;
0756ad15b1fef2 zhenwei pi         2022-05-06  117  	struct virtio_crypto_ctrl_request *vc_ctrl_req;
59ca6c93387d32 zhenwei pi         2022-03-02  118  
4409c08d806721 Christophe JAILLET 2023-02-04  119  	pkey = kmemdup(key, keylen, GFP_KERNEL);
59ca6c93387d32 zhenwei pi         2022-03-02  120  	if (!pkey)
59ca6c93387d32 zhenwei pi         2022-03-02  121  		return -ENOMEM;
59ca6c93387d32 zhenwei pi         2022-03-02  122  
0756ad15b1fef2 zhenwei pi         2022-05-06  123  	vc_ctrl_req = kzalloc(sizeof(*vc_ctrl_req), GFP_KERNEL);
0756ad15b1fef2 zhenwei pi         2022-05-06  124  	if (!vc_ctrl_req) {
0756ad15b1fef2 zhenwei pi         2022-05-06  125  		err = -ENOMEM;
0756ad15b1fef2 zhenwei pi         2022-05-06  126  		goto out;
0756ad15b1fef2 zhenwei pi         2022-05-06  127  	}
0756ad15b1fef2 zhenwei pi         2022-05-06  128  
0756ad15b1fef2 zhenwei pi         2022-05-06  129  	ctrl = &vc_ctrl_req->ctrl;
6fd763d155860e zhenwei pi         2022-05-06  130  	memcpy(&ctrl->header, header, sizeof(ctrl->header));
6fd763d155860e zhenwei pi         2022-05-06 @131  	memcpy(&ctrl->u, para, sizeof(ctrl->u));
0756ad15b1fef2 zhenwei pi         2022-05-06  132  	input = &vc_ctrl_req->input;
6fd763d155860e zhenwei pi         2022-05-06  133  	input->status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
59ca6c93387d32 zhenwei pi         2022-03-02  134  
6fd763d155860e zhenwei pi         2022-05-06  135  	sg_init_one(&outhdr_sg, ctrl, sizeof(*ctrl));
59ca6c93387d32 zhenwei pi         2022-03-02  136  	sgs[num_out++] = &outhdr_sg;
59ca6c93387d32 zhenwei pi         2022-03-02  137  
59ca6c93387d32 zhenwei pi         2022-03-02  138  	sg_init_one(&key_sg, pkey, keylen);
59ca6c93387d32 zhenwei pi         2022-03-02  139  	sgs[num_out++] = &key_sg;
59ca6c93387d32 zhenwei pi         2022-03-02  140  
6fd763d155860e zhenwei pi         2022-05-06  141  	sg_init_one(&inhdr_sg, input, sizeof(*input));
59ca6c93387d32 zhenwei pi         2022-03-02  142  	sgs[num_out + num_in++] = &inhdr_sg;
59ca6c93387d32 zhenwei pi         2022-03-02  143  
977231e8d45657 zhenwei pi         2022-05-06  144  	err = virtio_crypto_ctrl_vq_request(vcrypto, sgs, num_out, num_in, vc_ctrl_req);
977231e8d45657 zhenwei pi         2022-05-06  145  	if (err < 0)
59ca6c93387d32 zhenwei pi         2022-03-02  146  		goto out;
59ca6c93387d32 zhenwei pi         2022-03-02  147  
6fd763d155860e zhenwei pi         2022-05-06  148  	if (le32_to_cpu(input->status) != VIRTIO_CRYPTO_OK) {
0756ad15b1fef2 zhenwei pi         2022-05-06  149  		pr_err("virtio_crypto: Create session failed status: %u\n",
0756ad15b1fef2 zhenwei pi         2022-05-06  150  			le32_to_cpu(input->status));
59ca6c93387d32 zhenwei pi         2022-03-02  151  		err = -EINVAL;
59ca6c93387d32 zhenwei pi         2022-03-02  152  		goto out;
59ca6c93387d32 zhenwei pi         2022-03-02  153  	}
59ca6c93387d32 zhenwei pi         2022-03-02  154  
6fd763d155860e zhenwei pi         2022-05-06  155  	ctx->session_id = le64_to_cpu(input->session_id);
59ca6c93387d32 zhenwei pi         2022-03-02  156  	ctx->session_valid = true;
59ca6c93387d32 zhenwei pi         2022-03-02  157  	err = 0;
59ca6c93387d32 zhenwei pi         2022-03-02  158  
59ca6c93387d32 zhenwei pi         2022-03-02  159  out:
0756ad15b1fef2 zhenwei pi         2022-05-06  160  	kfree(vc_ctrl_req);
59ca6c93387d32 zhenwei pi         2022-03-02  161  	kfree_sensitive(pkey);
59ca6c93387d32 zhenwei pi         2022-03-02  162  
59ca6c93387d32 zhenwei pi         2022-03-02  163  	return err;
59ca6c93387d32 zhenwei pi         2022-03-02  164  }
59ca6c93387d32 zhenwei pi         2022-03-02  165  

:::::: The code at line 131 was first introduced by commit
:::::: 6fd763d155860eb7ea3a93c8b3bf926940ffa3fb virtio-crypto: change code style

:::::: TO: zhenwei pi <pizhenwei@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
