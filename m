Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB3346E4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626725; cv=none; b=i05CwSOC5B4mkB9lAc5hX1U6g6fQ2zUtuJPOAOUxxMXrZbemTbFOy8CrGAFjDjgfvC3HPSGQ0oAohkNsXmr4fvFx0T9Emwhg3V74a/TlDvKdwGY1PJ8mep75paDJ3T+3i2KO/QJDqCUV/z1f6aMlUJW13r53nvE44fKO+jNf/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626725; c=relaxed/simple;
	bh=tv6gO2sKkDzFZ+AnUu08+UvNMCj4XOGqQLe9r4F5Ag8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUeiSkX/GI82XJD5tW0VxTbJUkqPHG7r4hBC71+0SVrAKDg0inIyUo6Bp9KmU03dFwwgdHS4tzBdAnP/ptMe4V89UUhH0g2PDKj2qHHQzGHZTD1QlOEZSYejKTGAn7rVuhJJ8P5dThAMi54lzxn/8HzVDiMoF4QjAs6jZlF29Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaOEfelD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaOEfelD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449e96a8a80so761108f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 May 2026 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626722; x=1778231522; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcgbMr8730ZfrhMoIH0vuIIFReC/Ooz9fhLzTLVg0mA=;
        b=ZaOEfelDnkaPQQD64qZG7AQ5vJBdJKMtyY2GpcPMYAi2/RriK5NMpi4PAvUIC4e8xA
         WQFVCCD0JkiPycgJrgi2Xmf4K1mNs3bFWxSaPsRoRTcaiv0g/wavGeAsCc4vM626Fc3f
         UYnAcApq2mhECELHAwNGQ0j0ZeaBQdCE8E9NtCRVi6uV6A2V+GdqdqbWE/iXZQUld8Dj
         YXMoyF5luDmvCl4pi0tbrh0OY7inqpDrSpZNOD2eG3t31wN0hJ1ctjJOXjKe7NDPuNno
         dv1vuIFfkZqzw5l5grDd7MSMR9JkbMiNPPFOJuHBYwoukcYYCrP+ZAn2h+87j/kbjJoT
         hCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626722; x=1778231522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcgbMr8730ZfrhMoIH0vuIIFReC/Ooz9fhLzTLVg0mA=;
        b=J+Ygh+KK9fgEtyhpaGJZi1HFXxTR59DmAdS2u7HINlW4y1A2zlDutuCxVGHvaS5F+E
         l9icHSXzaJ6LRrXcoliW5Z+KKZFLmbzmg7jn9Pmw03AeTIOKsgTbUuyHiqahKFK++ruX
         e+coJdnx2zyMr35B0pw/ZlRX58l6Jp5AY0DanWcbRg5TjnxpTTU8WYXbq1k0zlWCQXwj
         JoZTrUzoMEjJASYJNGpO4hlFB4R7bVkqvB1SMTLVkWKiNTW9na55Xx6xIDxZ05CqP6mu
         0DNeIvQPWdOYpjqQZJ67RSW5dWcIltk1stUUapSFWQcM1krKlvUDhqONG6jMQkyrGjsz
         ICJA==
X-Forwarded-Encrypted: i=1; AFNElJ/s/+cwTTEzrRPd98ZNBCB4bgVGtoB2RUdWx5zEH2+2Z4PCfhmudw5QnwacwI3kxKkA0tiSqCQBu0AEj0xA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2V+f/2+Qz+EsFI3WzAPTfV92JPQWjBmNxp4r5fLaeG/sRixid
	7mWAA7KSBsjQN4cRhndKdtvfxEOrZFZekGXlpcbfTDJJ43mND+Enr+rC8fqojg==
X-Gm-Gg: AeBDievYjUCqcvqrGyWO4VP4wGsGlRPOwI54Eod+xz7tjiS1DL/5QGQTHeHHqp2vbef
	4Hmb0D349oNDl2hZ5tFEThRLUmBeUegIyJ8qOUSjDf+mnTDN0Gdlv/J3H35/pSeylrp0y0E4HZF
	onb5QF2XayXdvM5Lgejitc9b0lyapQA89PqX9+DyIHT8hXvtu2EresdG/bqBADnCuMfvh0xzuJi
	5Sf6IrmyVb3sT+/GmFkjT90SnFzWjkMyB6SWSIrrHNw7RLQa0OEDJcXSHuR9P3pLeevpiZJnKy6
	S5zRV5iL7cchUnyxjCPG46oU5xla3qdLPwLiQxNxEczF+LLbByBHKxo0oIvu+lGbzySOoik89W9
	4bMcDqsngkdNU12jtVmtPRRZsJ7ChrYN+BQDy2ZlXO5Kxul34XzMUhDR5FGzNAAW/UjzSO5+jic
	JttXfNvKMJPwRlsvz5o6ljWa4xfnqQ5g==
X-Received: by 2002:a05:6000:2002:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-4493fa018fcmr10085402f8f.35.1777626721968;
        Fri, 01 May 2026 02:12:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8f51bac8sm3861853f8f.16.2026.05.01.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:12:01 -0700 (PDT)
Date: Fri, 1 May 2026 12:11:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	Christoph Hellwig <hch@lst.de>
Subject: fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable
 dereferenced before check 'ni' (see line 122)
Message-ID: <202605011540.0FJWFGIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26fd6bff2c050196005312d1d306889220952a99
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
config: x86_64-randconfig-161-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011540.0FJWFGIn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605011540.0FJWFGIn-lkp@intel.com/

New smatch warnings:
fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'ni' (see line 122)
fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'attr' (see line 122)
fs/ntfs/attrib.c:2807 ntfs_attr_open() warn: variable dereferenced before check 'ni' (see line 2804)

Old smatch warnings:
fs/ntfs/attrib.c:2115 ntfs_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2111)
fs/ntfs/attrib.c:2237 ntfs_non_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2232)
fs/ntfs/attrib.c:4951 ntfs_attr_remove() warn: variable dereferenced before check 'ni' (see line 4950)

vim +/ni +126 fs/ntfs/attrlist.c

495e90fa334828d Namjae Jeon 2026-02-13  112  int ntfs_attrlist_entry_add(struct ntfs_inode *ni, struct attr_record *attr)
495e90fa334828d Namjae Jeon 2026-02-13  113  {
495e90fa334828d Namjae Jeon 2026-02-13  114  	struct attr_list_entry *ale;
495e90fa334828d Namjae Jeon 2026-02-13  115  	__le64 mref;
495e90fa334828d Namjae Jeon 2026-02-13  116  	struct ntfs_attr_search_ctx *ctx;
495e90fa334828d Namjae Jeon 2026-02-13  117  	u8 *new_al;
495e90fa334828d Namjae Jeon 2026-02-13  118  	int entry_len, entry_offset, err;
495e90fa334828d Namjae Jeon 2026-02-13  119  	struct mft_record *ni_mrec;
495e90fa334828d Namjae Jeon 2026-02-13  120  	u8 *old_al;
495e90fa334828d Namjae Jeon 2026-02-13  121  
495e90fa334828d Namjae Jeon 2026-02-13 @122  	ntfs_debug("Entering for inode 0x%llx, attr 0x%x.\n",
495e90fa334828d Namjae Jeon 2026-02-13  123  			(long long) ni->mft_no,
                                                                            ^^^^^^^^^^
495e90fa334828d Namjae Jeon 2026-02-13  124  			(unsigned int) le32_to_cpu(attr->type));
495e90fa334828d Namjae Jeon 2026-02-13  125  
495e90fa334828d Namjae Jeon 2026-02-13 @126  	if (!ni || !attr) {
                                                    ^^^
Checked too late.

495e90fa334828d Namjae Jeon 2026-02-13  127  		ntfs_debug("Invalid arguments.\n");
495e90fa334828d Namjae Jeon 2026-02-13  128  		return -EINVAL;
495e90fa334828d Namjae Jeon 2026-02-13  129  	}
495e90fa334828d Namjae Jeon 2026-02-13  130  
495e90fa334828d Namjae Jeon 2026-02-13  131  	ni_mrec = map_mft_record(ni);
495e90fa334828d Namjae Jeon 2026-02-13  132  	if (IS_ERR(ni_mrec)) {
495e90fa334828d Namjae Jeon 2026-02-13  133  		ntfs_debug("Invalid arguments.\n");
495e90fa334828d Namjae Jeon 2026-02-13  134  		return -EIO;
495e90fa334828d Namjae Jeon 2026-02-13  135  	}
495e90fa334828d Namjae Jeon 2026-02-13  136  
495e90fa334828d Namjae Jeon 2026-02-13  137  	mref = MK_LE_MREF(ni->mft_no, le16_to_cpu(ni_mrec->sequence_number));
495e90fa334828d Namjae Jeon 2026-02-13  138  	unmap_mft_record(ni);
495e90fa334828d Namjae Jeon 2026-02-13  139  
495e90fa334828d Namjae Jeon 2026-02-13  140  	if (ni->nr_extents == -1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

