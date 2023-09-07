Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B96FD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694097851; x=1725633851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dv0oDgguI6KeAJIqMaNo8FuROQkBzWti4/afM9QdQpQ=;
  b=Gu6g/hJ7iD/EO3Q/e143/CT9TnHSAlyFYNrhMaomAdRVoBPLUarcIgFr
   MHLWj+G2zSOZ+fEZnYuOLJyAMdWtyMNBpxLMFOofg8BvxhaU1kZOdZJpP
   TI46bWnqYkAktZZFK5oz07T8EJsGUIFtOFb8b69Aape2oAmnOLgdNU13c
   0cZBmDBBOigiv1EsxwLTFILb0GKWYgAEepzt+pElneGafcQ8Ou5Yx1p8W
   vocfj3CiDFM2UnFiDkt3iBsdQ6c6T/Yo7VQGFuJsp0TEJLKgJ/VBBwl6f
   VQneiz4PVNr1F9lxUNr9GqKOd/a/v8B//t/B6e3xCks25qf5BgIa8f9w4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374758980"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="374758980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 07:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771297917"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="771297917"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 07:44:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeGEm-0001Hy-2g;
	Thu, 07 Sep 2023 14:44:04 +0000
Date: Thu, 7 Sep 2023 22:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 117/627]
 drivers/s390/crypto/pkey_api.c:760:37: error: implicit declaration of
 function 'ep11_kb_wkvp'
Message-ID: <202309072254.wq77vkKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   5d9f1945e8e8e59e5dda60c28229fa68fdbca80b
commit: c284adc2ae24c07dcacded0079fb228b1e53c88d [117/627] s390/pkey: fix PKEY_TYPE_EP11_AES handling in PKEY_VERIFYKEY2 IOCTL
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230907/202309072254.wq77vkKA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072254.wq77vkKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072254.wq77vkKA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/s390/crypto/pkey_api.c: In function 'pkey_verifykey2':
>> drivers/s390/crypto/pkey_api.c:760:37: error: implicit declaration of function 'ep11_kb_wkvp' [-Werror=implicit-function-declaration]
     760 |                                     ep11_kb_wkvp(key, keylen));
         |                                     ^~~~~~~~~~~~
>> drivers/s390/crypto/pkey_api.c:760:37: warning: passing argument 7 of 'ep11_findcard2' makes pointer from integer without a cast [-Wint-conversion]
     760 |                                     ep11_kb_wkvp(key, keylen));
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   In file included from drivers/s390/crypto/pkey_api.c:28:
   drivers/s390/crypto/zcrypt_ep11misc.h:138:57: note: expected 'const u8 *' {aka 'const unsigned char *'} but argument is of type 'int'
     138 |                    int minhwtype, int minapi, const u8 *wkvp);
         |                                               ~~~~~~~~~~^~~~
   drivers/s390/crypto/pkey_api.c:785:37: warning: passing argument 7 of 'ep11_findcard2' makes pointer from integer without a cast [-Wint-conversion]
     785 |                                     ep11_kb_wkvp(key, keylen));
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   drivers/s390/crypto/zcrypt_ep11misc.h:138:57: note: expected 'const u8 *' {aka 'const unsigned char *'} but argument is of type 'int'
     138 |                    int minhwtype, int minapi, const u8 *wkvp);
         |                                               ~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/ep11_kb_wkvp +760 drivers/s390/crypto/pkey_api.c

   666	
   667	static int pkey_verifykey2(const u8 *key, size_t keylen,
   668				   u16 *cardnr, u16 *domain,
   669				   enum pkey_key_type *ktype,
   670				   enum pkey_key_size *ksize, u32 *flags)
   671	{
   672		int rc;
   673		u32 _nr_apqns, *_apqns = NULL;
   674		struct keytoken_header *hdr = (struct keytoken_header *)key;
   675	
   676		if (keylen < sizeof(struct keytoken_header))
   677			return -EINVAL;
   678	
   679		if (hdr->type == TOKTYPE_CCA_INTERNAL &&
   680		    hdr->version == TOKVER_CCA_AES) {
   681			struct secaeskeytoken *t = (struct secaeskeytoken *)key;
   682	
   683			rc = cca_check_secaeskeytoken(debug_info, 3, key, 0);
   684			if (rc)
   685				goto out;
   686			if (ktype)
   687				*ktype = PKEY_TYPE_CCA_DATA;
   688			if (ksize)
   689				*ksize = (enum pkey_key_size)t->bitsize;
   690	
   691			rc = cca_findcard2(&_apqns, &_nr_apqns, *cardnr, *domain,
   692					   ZCRYPT_CEX3C, AES_MK_SET, t->mkvp, 0, 1);
   693			if (rc == 0 && flags)
   694				*flags = PKEY_FLAGS_MATCH_CUR_MKVP;
   695			if (rc == -ENODEV) {
   696				rc = cca_findcard2(&_apqns, &_nr_apqns,
   697						   *cardnr, *domain,
   698						   ZCRYPT_CEX3C, AES_MK_SET,
   699						   0, t->mkvp, 1);
   700				if (rc == 0 && flags)
   701					*flags = PKEY_FLAGS_MATCH_ALT_MKVP;
   702			}
   703			if (rc)
   704				goto out;
   705	
   706			*cardnr = ((struct pkey_apqn *)_apqns)->card;
   707			*domain = ((struct pkey_apqn *)_apqns)->domain;
   708	
   709		} else if (hdr->type == TOKTYPE_CCA_INTERNAL &&
   710			   hdr->version == TOKVER_CCA_VLSC) {
   711			struct cipherkeytoken *t = (struct cipherkeytoken *)key;
   712	
   713			rc = cca_check_secaescipherkey(debug_info, 3, key, 0, 1);
   714			if (rc)
   715				goto out;
   716			if (ktype)
   717				*ktype = PKEY_TYPE_CCA_CIPHER;
   718			if (ksize) {
   719				*ksize = PKEY_SIZE_UNKNOWN;
   720				if (!t->plfver && t->wpllen == 512)
   721					*ksize = PKEY_SIZE_AES_128;
   722				else if (!t->plfver && t->wpllen == 576)
   723					*ksize = PKEY_SIZE_AES_192;
   724				else if (!t->plfver && t->wpllen == 640)
   725					*ksize = PKEY_SIZE_AES_256;
   726			}
   727	
   728			rc = cca_findcard2(&_apqns, &_nr_apqns, *cardnr, *domain,
   729					   ZCRYPT_CEX6, AES_MK_SET, t->mkvp0, 0, 1);
   730			if (rc == 0 && flags)
   731				*flags = PKEY_FLAGS_MATCH_CUR_MKVP;
   732			if (rc == -ENODEV) {
   733				rc = cca_findcard2(&_apqns, &_nr_apqns,
   734						   *cardnr, *domain,
   735						   ZCRYPT_CEX6, AES_MK_SET,
   736						   0, t->mkvp0, 1);
   737				if (rc == 0 && flags)
   738					*flags = PKEY_FLAGS_MATCH_ALT_MKVP;
   739			}
   740			if (rc)
   741				goto out;
   742	
   743			*cardnr = ((struct pkey_apqn *)_apqns)->card;
   744			*domain = ((struct pkey_apqn *)_apqns)->domain;
   745	
   746		} else if (hdr->type == TOKTYPE_NON_CCA &&
   747			   hdr->version == TOKVER_EP11_AES) {
   748			struct ep11keyblob *kb = (struct ep11keyblob *)key;
   749	
   750			rc = ep11_check_aes_key(debug_info, 3, key, keylen, 1);
   751			if (rc)
   752				goto out;
   753			if (ktype)
   754				*ktype = PKEY_TYPE_EP11;
   755			if (ksize)
   756				*ksize = kb->head.bitlen;
   757	
   758			rc = ep11_findcard2(&_apqns, &_nr_apqns, *cardnr, *domain,
   759					    ZCRYPT_CEX7, EP11_API_V,
 > 760					    ep11_kb_wkvp(key, keylen));
   761			if (rc)
   762				goto out;
   763	
   764			if (flags)
   765				*flags = PKEY_FLAGS_MATCH_CUR_MKVP;
   766	
   767			*cardnr = ((struct pkey_apqn *)_apqns)->card;
   768			*domain = ((struct pkey_apqn *)_apqns)->domain;
   769	
   770		} else if (hdr->type == TOKTYPE_NON_CCA &&
   771			   hdr->version == TOKVER_EP11_AES_WITH_HEADER) {
   772			struct ep11kblob_header *kh = (struct ep11kblob_header *)key;
   773	
   774			rc = ep11_check_aes_key_with_hdr(debug_info, 3,
   775							 key, keylen, 1);
   776			if (rc)
   777				goto out;
   778			if (ktype)
   779				*ktype = PKEY_TYPE_EP11_AES;
   780			if (ksize)
   781				*ksize = kh->bitlen;
   782	
   783			rc = ep11_findcard2(&_apqns, &_nr_apqns, *cardnr, *domain,
   784					    ZCRYPT_CEX7, EP11_API_V,
   785					    ep11_kb_wkvp(key, keylen));
   786			if (rc)
   787				goto out;
   788	
   789			if (flags)
   790				*flags = PKEY_FLAGS_MATCH_CUR_MKVP;
   791	
   792			*cardnr = ((struct pkey_apqn *)_apqns)->card;
   793			*domain = ((struct pkey_apqn *)_apqns)->domain;
   794		} else {
   795			rc = -EINVAL;
   796		}
   797	
   798	out:
   799		kfree(_apqns);
   800		return rc;
   801	}
   802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
