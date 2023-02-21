Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544DC1C07
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676974799; x=1708510799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hTC1+XGTbY8L8XZg5gdiSQYRa0fgdWOc9n2ajGOyiTk=;
  b=OFv5zUn+3chqKuteELd9wNQscFZnqLZGCXVB5zchnPRVxW3Ck+xFqMWL
   pJ0IPF9QQ9Y9Eo4pkzPGLsmb/9kMRX7qu5modb3lq5/lSId+f/EAxY/5D
   RkPiwALDHu24xNkisrviPGcX5kSDj6b92lzqoG/NgJ5qvgJV1NOWkC7Wo
   haxEb/dBUfq5JN4lgyz2VkMFUI9PWn5U5SCLAEtkbDKuqqNBqPRZKYw2H
   i3SqnQV4nPdREfZ3BIMvN824q5NUnFTNsPU9x8ytGH/OJLOcpdzQCjVi8
   8pSIN0EII07pk2CqeZtqBiCHyMVXJLtyTjUmHudW3/+NtvduDLfiDepi3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333955542"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333955542"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 02:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="780954588"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="780954588"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2023 02:19:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUPka-000Efh-1m;
	Tue, 21 Feb 2023 10:19:56 +0000
Date: Tue, 21 Feb 2023 18:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/zen-sauce 8/28]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:9: warning: 'memcpy'
 reading 56 bytes from a region of size 20
Message-ID: <202302211836.yb92DbfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/zen-sauce
head:   34ffdd85e0b24ac24ba0802b0cc365335e24bec0
commit: e0a5d55aaf9670b2967538babaeb3263630f0f24 [8/28] ZEN: Disable stack conservation for GCC
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230221/202302211836.yb92DbfS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/e0a5d55aaf9670b2967538babaeb3263630f0f24
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/zen-sauce
        git checkout e0a5d55aaf9670b2967538babaeb3263630f0f24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/crypto/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211836.yb92DbfS-lkp@intel.com/

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

59ca6c93387d32 zhenwei pi 2022-03-02  105  
59ca6c93387d32 zhenwei pi 2022-03-02  106  static int virtio_crypto_alg_akcipher_init_session(struct virtio_crypto_akcipher_ctx *ctx,
59ca6c93387d32 zhenwei pi 2022-03-02  107  		struct virtio_crypto_ctrl_header *header, void *para,
59ca6c93387d32 zhenwei pi 2022-03-02  108  		const uint8_t *key, unsigned int keylen)
59ca6c93387d32 zhenwei pi 2022-03-02  109  {
59ca6c93387d32 zhenwei pi 2022-03-02  110  	struct scatterlist outhdr_sg, key_sg, inhdr_sg, *sgs[3];
59ca6c93387d32 zhenwei pi 2022-03-02  111  	struct virtio_crypto *vcrypto = ctx->vcrypto;
59ca6c93387d32 zhenwei pi 2022-03-02  112  	uint8_t *pkey;
59ca6c93387d32 zhenwei pi 2022-03-02  113  	int err;
59ca6c93387d32 zhenwei pi 2022-03-02  114  	unsigned int num_out = 0, num_in = 0;
6fd763d155860e zhenwei pi 2022-05-06  115  	struct virtio_crypto_op_ctrl_req *ctrl;
6fd763d155860e zhenwei pi 2022-05-06  116  	struct virtio_crypto_session_input *input;
0756ad15b1fef2 zhenwei pi 2022-05-06  117  	struct virtio_crypto_ctrl_request *vc_ctrl_req;
59ca6c93387d32 zhenwei pi 2022-03-02  118  
59ca6c93387d32 zhenwei pi 2022-03-02  119  	pkey = kmemdup(key, keylen, GFP_ATOMIC);
59ca6c93387d32 zhenwei pi 2022-03-02  120  	if (!pkey)
59ca6c93387d32 zhenwei pi 2022-03-02  121  		return -ENOMEM;
59ca6c93387d32 zhenwei pi 2022-03-02  122  
0756ad15b1fef2 zhenwei pi 2022-05-06  123  	vc_ctrl_req = kzalloc(sizeof(*vc_ctrl_req), GFP_KERNEL);
0756ad15b1fef2 zhenwei pi 2022-05-06  124  	if (!vc_ctrl_req) {
0756ad15b1fef2 zhenwei pi 2022-05-06  125  		err = -ENOMEM;
0756ad15b1fef2 zhenwei pi 2022-05-06  126  		goto out;
0756ad15b1fef2 zhenwei pi 2022-05-06  127  	}
0756ad15b1fef2 zhenwei pi 2022-05-06  128  
0756ad15b1fef2 zhenwei pi 2022-05-06  129  	ctrl = &vc_ctrl_req->ctrl;
6fd763d155860e zhenwei pi 2022-05-06  130  	memcpy(&ctrl->header, header, sizeof(ctrl->header));
6fd763d155860e zhenwei pi 2022-05-06 @131  	memcpy(&ctrl->u, para, sizeof(ctrl->u));
0756ad15b1fef2 zhenwei pi 2022-05-06  132  	input = &vc_ctrl_req->input;
6fd763d155860e zhenwei pi 2022-05-06  133  	input->status = cpu_to_le32(VIRTIO_CRYPTO_ERR);
59ca6c93387d32 zhenwei pi 2022-03-02  134  
6fd763d155860e zhenwei pi 2022-05-06  135  	sg_init_one(&outhdr_sg, ctrl, sizeof(*ctrl));
59ca6c93387d32 zhenwei pi 2022-03-02  136  	sgs[num_out++] = &outhdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  137  
59ca6c93387d32 zhenwei pi 2022-03-02  138  	sg_init_one(&key_sg, pkey, keylen);
59ca6c93387d32 zhenwei pi 2022-03-02  139  	sgs[num_out++] = &key_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  140  
6fd763d155860e zhenwei pi 2022-05-06  141  	sg_init_one(&inhdr_sg, input, sizeof(*input));
59ca6c93387d32 zhenwei pi 2022-03-02  142  	sgs[num_out + num_in++] = &inhdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  143  
977231e8d45657 zhenwei pi 2022-05-06  144  	err = virtio_crypto_ctrl_vq_request(vcrypto, sgs, num_out, num_in, vc_ctrl_req);
977231e8d45657 zhenwei pi 2022-05-06  145  	if (err < 0)
59ca6c93387d32 zhenwei pi 2022-03-02  146  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  147  
6fd763d155860e zhenwei pi 2022-05-06  148  	if (le32_to_cpu(input->status) != VIRTIO_CRYPTO_OK) {
0756ad15b1fef2 zhenwei pi 2022-05-06  149  		pr_err("virtio_crypto: Create session failed status: %u\n",
0756ad15b1fef2 zhenwei pi 2022-05-06  150  			le32_to_cpu(input->status));
59ca6c93387d32 zhenwei pi 2022-03-02  151  		err = -EINVAL;
59ca6c93387d32 zhenwei pi 2022-03-02  152  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  153  	}
59ca6c93387d32 zhenwei pi 2022-03-02  154  
6fd763d155860e zhenwei pi 2022-05-06  155  	ctx->session_id = le64_to_cpu(input->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  156  	ctx->session_valid = true;
59ca6c93387d32 zhenwei pi 2022-03-02  157  	err = 0;
59ca6c93387d32 zhenwei pi 2022-03-02  158  
59ca6c93387d32 zhenwei pi 2022-03-02  159  out:
0756ad15b1fef2 zhenwei pi 2022-05-06  160  	kfree(vc_ctrl_req);
59ca6c93387d32 zhenwei pi 2022-03-02  161  	kfree_sensitive(pkey);
59ca6c93387d32 zhenwei pi 2022-03-02  162  
59ca6c93387d32 zhenwei pi 2022-03-02  163  	return err;
59ca6c93387d32 zhenwei pi 2022-03-02  164  }
59ca6c93387d32 zhenwei pi 2022-03-02  165  

:::::: The code at line 131 was first introduced by commit
:::::: 6fd763d155860eb7ea3a93c8b3bf926940ffa3fb virtio-crypto: change code style

:::::: TO: zhenwei pi <pizhenwei@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
