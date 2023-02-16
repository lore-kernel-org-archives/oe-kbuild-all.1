Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105FA746E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676558977; x=1708094977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DzfxCkLUfTFD8XJxb1li1g7wOfsHJQXhG/FPU/fVBSU=;
  b=Bw2u95Ma7gnOV/vqwb3G2qdjh1tetB9uE7EDFV1InZr93runyQgZMepd
   JlhS8ewt0BqlhYM+hvW6HZv6sLkcAqZrX8PgZGDjL4U02aKcs0V8XOp0y
   fVDTJcZsWu+u2lRBGFITUi47tseUdpZKZYhbXOrnsdYAHpI09bUPVOmlf
   dcRt2rcg+dAQ9l/1T5RCZqjBClDMvPCONVsJHk2x/c1GKk4t/rNtnrwKC
   zD0KAXDP78dabn/p0muhy12UsCJhI4VTUp03qifWIurZDVqEhlQq2ePuw
   sXplDuaDB1CdHFLWCagsJQElYxHaFBJnCIan9y3wlVEqVbzYwgJLgofol
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396377183"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="396377183"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 06:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663476638"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="663476638"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 06:49:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSfZg-000AIj-0h;
	Thu, 16 Feb 2023 14:49:28 +0000
Date: Thu, 16 Feb 2023 22:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: Shreenidhi Shedi <yesshedi@gmail.com>, dhowells@redhat.com,
	dwmw2@infradead.org, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shreenidhi Shedi <sshedi@vmware.com>
Subject: Re: [PATCH v3 2/6] sign-file: move file signing logic to its own
 function
Message-ID: <202302162229.XFMtVABh-lkp@intel.com>
References: <20230213190034.57097-2-sshedi@vmware.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213190034.57097-2-sshedi@vmware.com>

Hi Shreenidhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc8 next-20230216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shreenidhi-Shedi/sign-file-move-file-signing-logic-to-its-own-function/20230214-030302
patch link:    https://lore.kernel.org/r/20230213190034.57097-2-sshedi%40vmware.com
patch subject: [PATCH v3 2/6] sign-file: move file signing logic to its own function
config: riscv-randconfig-r042-20230213 (https://download.01.org/0day-ci/archive/20230216/202302162229.XFMtVABh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1dfab8ead8d3f9c0c04eeeaf7c436a2878f2158e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shreenidhi-Shedi/sign-file-move-file-signing-logic-to-its-own-function/20230214-030302
        git checkout 1dfab8ead8d3f9c0c04eeeaf7c436a2878f2158e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302162229.XFMtVABh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/sign-file.c:318:5: warning: no previous prototype for 'sign_file' [-Wmissing-prototypes]
     318 | int sign_file(int argc, char **argv, struct cmd_opts *opts)
         |     ^~~~~~~~~
   scripts/sign-file.c: In function 'sign_file':
   scripts/sign-file.c:333:13: warning: unused variable 'i' [-Wunused-variable]
     333 |         int i, n;
         |             ^
--
>> scripts/sign-file.c:318:5: warning: no previous prototype for 'sign_file' [-Wmissing-prototypes]
     318 | int sign_file(int argc, char **argv, struct cmd_opts *opts)
         |     ^~~~~~~~~
   scripts/sign-file.c: In function 'sign_file':
   scripts/sign-file.c:333:13: warning: unused variable 'i' [-Wunused-variable]
     333 |         int i, n;
         |             ^


vim +/sign_file +318 scripts/sign-file.c

   317	
 > 318	int sign_file(int argc, char **argv, struct cmd_opts *opts)
   319	{
   320		struct module_signature sig_info = { .id_type = PKEY_ID_PKCS7 };
   321		unsigned char buf[4096] = {0};
   322		unsigned long module_size, sig_size;
   323		unsigned int use_signed_attrs;
   324		const EVP_MD *digest_algo;
   325		EVP_PKEY *private_key;
   326	#ifndef USE_PKCS7
   327		CMS_ContentInfo *cms = NULL;
   328	#else
   329		PKCS7 *pkcs7 = NULL;
   330	#endif
   331		X509 *x509;
   332		BIO *bd, *bm;
   333		int i, n;
   334	
   335		char *hash_algo = opts->hash_algo;
   336		char *dest_name = opts->dest_name;
   337		char *private_key_name = opts->private_key_name;
   338		char *raw_sig_name = opts->raw_sig_name;
   339		char *x509_name = opts->x509_name;
   340		char *module_name = opts->module_name;
   341		bool save_sig = opts->save_sig;
   342		bool replace_orig = opts->replace_orig;
   343		bool raw_sig = opts->raw_sig;
   344		bool sign_only = opts->sign_only;
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
