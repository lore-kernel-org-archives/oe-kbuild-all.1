Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD547E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685170437; x=1716706437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsB7SJelfjdgjWvtsj78ARU8uHuR2tluesEMJdI7F7c=;
  b=Y54YJ/mXNi9z2JbSvbc2rwMe1h74Mb3tvacqlBIXhvjUpdmGLy8KqC9r
   CtXO1TgjUaCGMZHfDkeiSodcCRQKgbUlfVUjrp60DbSr/ekvcoMLVi21I
   2Z2BJm3LWliy5ZFXsgdoWuRPDDvuN3XZpivIQ4ZAX4yI5xQMgfgXYaMHf
   D3YoV4S34CzXFpNR9IHSBDqBQeLGwQ3040JyEyA25ATgvQJ53V4JkCxc5
   I0NTBJawb2h/lJ6le1+z0bMOPy64vp/UILz0LMIxKKznjnm832b3/Hx+k
   t1R8o9HwFtqE/eWb3GJrYL767cM+j8+Oc1iynXBYQsdcw4TIr47E7ymkG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333995848"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="333995848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 23:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879768822"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="879768822"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 23:53:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2noI-000Jp8-2l;
	Sat, 27 May 2023 06:53:54 +0000
Date: Sat, 27 May 2023 14:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/zen-sauce 8/30]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:9: warning: 'memcpy'
 reading 56 bytes from a region of size 20
Message-ID: <202305271402.RIbrAVed-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.3/zen-sauce
head:   c25bf38649c4d20ae29994b1dadd4e87c3e67bf9
commit: ceddd33591c7112b797b7ca623d65679be0333c2 [8/30] ZEN: Disable stack conservation for GCC
config: powerpc-randconfig-r001-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271402.RIbrAVed-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/ceddd33591c7112b797b7ca623d65679be0333c2
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.3/zen-sauce
        git checkout ceddd33591c7112b797b7ca623d65679be0333c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/crypto/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271402.RIbrAVed-lkp@intel.com/

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
