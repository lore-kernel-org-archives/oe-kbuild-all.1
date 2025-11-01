Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4722224AE6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761969192; cv=none; b=djNoRW63Tk+3+iEurad2xicveZwQ9a9YN/o0idhoAfO6lM5jQ+TmHaJvpLI50agkXQkTttAOH1RhmXn87ICUrhqL6zGxRhf1zuDVkRDAmhZjl948qJ26k4fhdYHCXFSOWMi+3UUV4pnI3TUu7WSEWJUHunUA3FvwG0UN9VNVf1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761969192; c=relaxed/simple;
	bh=/GFc4IeKEqkqId6cYy+XZp7qHAD5i2mvQkTWC/3rfh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=au4DKZV+iBjDZLB+53lCT+uHA8+91O2vVgO0TGUTIAbQHN8X0NeZeaWsGS3Fl5AjVUZHVOSUCHrnSIkujIWi/4pHq8J7cX2/4+LhAn2rHfr9bkcn+2ulzEIb+hjK2oyTA67K7eRxhg+KnE91Qs4FQ2swDxqVs1xui7JrLrKB/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhzM6vjB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhzM6vjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761969191; x=1793505191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/GFc4IeKEqkqId6cYy+XZp7qHAD5i2mvQkTWC/3rfh8=;
  b=nhzM6vjBdB1N2+iH2hbW/5nfZM1PzZxs4nZJP7rxTuRH+XUehORmba19
   33KMd9oTqmtc5RsQeD4Ow6lEtpA141KmV4lqkTDoH/lFbl7bdcCkDi8OK
   dO9kCrVnbk9Bops+5liZeQZkPyt5IWV0TK46IwOQhKMU+fVYnDW/3WTU6
   ihqHzKEQYltRq8OgBSmyEa6VjZIvMN6/ppGTvobFW4GDxi+1RqX5y9vHg
   c1I6MJV6HD+CkJUhYqKNiV+UrdgOSwpHTrp+6XHvVs1xcaJkqHAO81aCF
   7zZOrv9DsVpwuW5RCMwhqk9b7LYbqPfypfIZIxbBY6iEHf2gxf7Wbif7c
   Q==;
X-CSE-ConnectionGUID: Sz8JWOu2TuqN3w7UHBQUDw==
X-CSE-MsgGUID: dJ98wDYbSwCujIMk/8Ufsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86758083"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="86758083"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 20:53:10 -0700
X-CSE-ConnectionGUID: WIVQOmJeTwC4/u7mr/D7Gg==
X-CSE-MsgGUID: TFCdTNcWTEWvD4sgVQvtlw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2025 20:53:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF2fr-000Nu8-0k;
	Sat, 01 Nov 2025 03:53:07 +0000
Date: Sat, 1 Nov 2025 11:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.19 4/21] include/linux/nvme-keyring.h:57:4:
 warning: no previous prototype for 'nvme_dhchap_psk_hash'
Message-ID: <202511011105.ef5UauN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   453ba3089d4570c2be2e230e1e7a287eac4b306b
commit: 8d9937531a4d3cb6d2d352c46dd807bfa52988b6 [4/21] nvme-keyring: add 'dhchap' key type
config: i386-randconfig-061-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011105.ef5UauN7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011105.ef5UauN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011105.ef5UauN7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^~~~~~~~~~~~~~~~~~~~


vim +/nvme_dhchap_psk_hash +57 include/linux/nvme-keyring.h

    26	
    27	#else
    28	static inline struct key *nvme_tls_psk_refresh(struct key *keyring,
    29			u8 *data, size_t data_len, const char *digest)
    30	{
    31		return ERR_PTR(-ENOTSUPP);
    32	}
    33	static inline key_serial_t nvme_tls_psk_default(struct key *keyring,
    34			const char *hostnqn, const char *subnqn)
    35	{
    36		return 0;
    37	}
    38	static inline key_serial_t nvme_keyring_id(void)
    39	{
    40		return 0;
    41	}
    42	static inline struct key *nvme_tls_key_lookup(key_serial_t key_id)
    43	{
    44		return ERR_PTR(-ENOTSUPP);
    45	}
    46	static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
    47			const char *hostnqn, const char *subnqn,
    48			u8 *data, size_t data_len)
    49	{
    50		return ERR_PTR(-ENOTSUPP);
    51	}
    52	static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
    53			const char *hostnqn, const char *subnqn, u8 hmac)
    54	{
    55		return ERR_PTR(-ENOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
