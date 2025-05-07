Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529DB21770A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616305; cv=none; b=h0vnVuAVusQ+6eQV8FYoGXXVzWv3vsHXI0fkI8zAU4wS0e8rOu7iTI6aBciz8Bhc10cOYN7eL2C21LeyKeFV+U5Ws6ohEpAovkiK1auZ7a3tz2Pqy88DZoOeWozQ0fPhQ5jBujsCzvkdDdCdI++Gf9byurjrG2xulDewjp5RJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616305; c=relaxed/simple;
	bh=O7T7lURmPzlyhlz2lQ5rfia6zH9kBYDQv5+Igz+urG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvkFqyMSJHhrEk2GPBtROSh5jD1Icr4fHHwUh6nWHpTXQpgk9fPhGQSNZEho05HH/2OX4HJ8BXF0pXRhIZH5FnUL91XrYfjuI24WUTAIuSxexMTioQWp6jfLuPc0RiybmCS9sBt0rLDTqdWBZPOBHG8pw4z2w94PrRLmgq802uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyDMhj1a; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyDMhj1a"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b6773f8dso351199f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746616301; x=1747221101; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixwft/rRHcnE7vrEwrCxcGZPZGqd0iNXvgYvekcku+k=;
        b=zyDMhj1aJdUz41enXg9uHTn/DUaqeohBFZRsQQZ4dM2TlBM1Jfoln2+Pzb2LVKRFOf
         j5gJu///Q92VRpEIuldUnxzFj+5XyH7iOng7aC4+7HTpQpunjbHVriUxCY+n3Jd5p6ew
         m3TNHCPfgATbDMAj0NF1CBVMe3zt4CFGaKDGhLGI9lis9zBJM/1hn/UXL7irXL5dALf9
         HVDawqu6ARHYSZX39x6pBdKsVvJAgT77B9N0J1kiJXjSo91diwUn/mJM9wSaD2TAlm+h
         fz2XsFbjhlc6bnyBQS/fE+1y9MQrXOEFQPQ4E9fleZptz2kZVV8fXC/JRviKw5ElY5df
         8uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616301; x=1747221101;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixwft/rRHcnE7vrEwrCxcGZPZGqd0iNXvgYvekcku+k=;
        b=gkF/UwBlsW3TxzNAz3MkzMRyKoIhVowNEewCX+gfzVfOtA91gPEjBC5Sw2XV8dIWq9
         hEgCjnq1EzwjWkun9txiEv5I4Vff8uDYhs7a1pN9qjyGAQxHFdXzA6Tl0aaHz9GhrK4f
         cMO6GXmF8eD6/igYPTRW0Usyi9hD5v8KCry6k4PG8Q7lXe1xEwbB1nI+6KgESxfCbJRT
         8gV2oiHuvUtPtS1uWOwKiUvCS7FD5sDubKBsn+IoFDGpf1lhpkAxTjX3x0f7q4PJT67P
         Qom72bC44HQEOfTxSaw7QkFgJwybMGp0RSNY3mmjY2I6IkbZ7yobw073rtBPoTmxWRP8
         mD5A==
X-Forwarded-Encrypted: i=1; AJvYcCX/nczvEaRa+474uePj6BJRRYCCJD7EW0KirRl/mHpCeqh24hjODO1dEGLy/UngNElffqAzrZbq4n1jeORp@lists.linux.dev
X-Gm-Message-State: AOJu0YxjY6SHImMFgNXzlON6W3mFRZBj2/VndX32WbysvLnp/wKPChTp
	AG0bTZELMrCrEsBL/xLoxNJYyWiJER/LOdUb7iJtVAQwQMM2JgCY2OQbO1GD2O4=
X-Gm-Gg: ASbGnctD/In766lNgFIE243Z7ogNDxDosmv6gPLzCbXQNkWtWz0VHO1CuVWIPmXPbby
	H18QZfEw0iYoxi/zpMLNr/olGC/rAmh5WWit/+4LB0joXhgubLN8NA4M33dBUTouM8/AdwfsznW
	zbC/YN63tORRay+S4fe6h6W5qPh4UN9onfFJzhaMWw8oEdcBIvGiyQwpvtIy6Rzo5Z78iJXXYN6
	HNtWlTQi2ymXpT7rYIdyDRLXMaIpaOS8ZJPxbcZ7bmWnTASSryTnTDxYk0LXhO4nEyluFbQpnWK
	p+ChBuiQgMpnKD9pLrA9Ox21Pd8YRFMjJP97id5j0Bq91A==
X-Google-Smtp-Source: AGHT+IHdeEC4ULtNZiSQLIW/WZraK7DAmPtaYRcs3Y6BdK2zeWsY8QWGYwu/gFJBVlqAslMuVCnFBA==
X-Received: by 2002:a05:6000:1445:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-3a0b4a105abmr2600950f8f.57.1746616301552;
        Wed, 07 May 2025 04:11:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b350f604sm3137441f8f.21.2025.05.07.04.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:11:41 -0700 (PDT)
Date: Wed, 7 May 2025 14:11:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shivank Garg <shivankg@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
Message-ID: <202505071850.XaOkcCkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 39ed4d1a0e03ce3ac2145ee7ef0714c78bae9c61 [7893/8235] jfs: implement migrate_folio for jfs_metapage_aops
config: i386-randconfig-141-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071850.XaOkcCkX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505071850.XaOkcCkX-lkp@intel.com/

smatch warnings:
fs/jfs/jfs_metapage.c:245 __metapage_migrate_folio() error: we previously assumed 'mp' could be null (see line 235)

vim +/mp +245 fs/jfs/jfs_metapage.c

39ed4d1a0e03ce Shivank Garg  2025-04-30  227  static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
39ed4d1a0e03ce Shivank Garg  2025-04-30  228  				    struct folio *src, enum migrate_mode mode)
39ed4d1a0e03ce Shivank Garg  2025-04-30  229  {
39ed4d1a0e03ce Shivank Garg  2025-04-30  230  	struct metapage *mp;
39ed4d1a0e03ce Shivank Garg  2025-04-30  231  	int page_offset;
39ed4d1a0e03ce Shivank Garg  2025-04-30  232  	int rc;
39ed4d1a0e03ce Shivank Garg  2025-04-30  233  
39ed4d1a0e03ce Shivank Garg  2025-04-30  234  	mp = folio_to_mp(src, 0);
39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
                                                    ^^
If mp is NULL

39ed4d1a0e03ce Shivank Garg  2025-04-30  236  		return -EAGAIN;
39ed4d1a0e03ce Shivank Garg  2025-04-30  237  
39ed4d1a0e03ce Shivank Garg  2025-04-30  238  	rc = filemap_migrate_folio(mapping, dst, src, mode);
39ed4d1a0e03ce Shivank Garg  2025-04-30  239  	if (rc != MIGRATEPAGE_SUCCESS)
39ed4d1a0e03ce Shivank Garg  2025-04-30  240  		return rc;
39ed4d1a0e03ce Shivank Garg  2025-04-30  241  
39ed4d1a0e03ce Shivank Garg  2025-04-30  242  	if (unlikely(insert_metapage(dst, mp)))
39ed4d1a0e03ce Shivank Garg  2025-04-30  243  		return -EAGAIN;
39ed4d1a0e03ce Shivank Garg  2025-04-30  244  
39ed4d1a0e03ce Shivank Garg  2025-04-30 @245  	page_offset = mp->data - folio_address(src);
                                                              ^^
Then this will crash.

39ed4d1a0e03ce Shivank Garg  2025-04-30  246  	mp->data = folio_address(dst) + page_offset;
39ed4d1a0e03ce Shivank Garg  2025-04-30  247  	mp->folio = dst;
39ed4d1a0e03ce Shivank Garg  2025-04-30  248  	remove_metapage(src, mp);
39ed4d1a0e03ce Shivank Garg  2025-04-30  249  
39ed4d1a0e03ce Shivank Garg  2025-04-30  250  	return MIGRATEPAGE_SUCCESS;
39ed4d1a0e03ce Shivank Garg  2025-04-30  251  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

