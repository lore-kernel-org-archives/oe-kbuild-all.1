Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D802328B41
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615018; cv=none; b=gSThPqpmD9kLmjygP2JHtVLSRkY8qXAae/1zFAFfwdkQZPGygaVyVmJE9dYto6RxsspNqfkSwDEkOs3gSLed/LPtLOMm9jawRIHXYzli5yPV+y/OnNsiA3UHoL1nNZg69Riz+X73PaOciktnjzXL4cDRS9QUXqxTYq+GFDYas3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615018; c=relaxed/simple;
	bh=6dOVx7g7rAkSYZ+pGDeFKJOvADsCxEZ4218tsomazvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=skZJvhA3FJoM14RIC8Gg6MOT50hbYfMbSvBT5DJ1KZ2xVc6CXaKASUjwg0dOUv8bPVs9kvj/W01L1OCzbkCSQRnk6Ugi62+jiUbszLFjwfPHyDO7Uxi//W8wfDcaZ9MGrKagsU7juWCnik1ejy1KxJ69hZCm0ehEU5gOCQI/mdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsOIZyuj; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsOIZyuj"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432777da980so4140055f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767615015; x=1768219815; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vrKYiPaJtKrFUdDX5nTyTKvlBuo7zRPTjp9yLaDxbc=;
        b=nsOIZyuj5UYLZm5A8CrIgOzhcvsCIu36g3KeEYL91/u9U6TR7mZr/YgyVNmAfAG4Mg
         dAm1J+UhvVEF0P3wGjw+1JP8Sv/McqUf0RPzEo4RKzoP81xicO/1ZZ/AYuuWkts8ZnZJ
         dH/if+cJfWPENYEhUIJHSWaN5kpymaQQf7aFMUTjJhzlZYC9KfsAiuw1zxMyaVye3XI0
         nUbAu6SVtxVfkW98RjAtuEy0hnwhsYAf0aU7O4Rj2Y7Th3cjNOgzNadEY3vPZjPqn9MU
         D+q8m30JUMLu1IL521jBljjmNaBhV308zvBz3x+vgTlo9zKWghCrDpOK26m9dYiBSP2T
         Ilxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615015; x=1768219815;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vrKYiPaJtKrFUdDX5nTyTKvlBuo7zRPTjp9yLaDxbc=;
        b=AcrVqoOrRq/Vk2AU3sQLSaEMFxX3p6cRL5Fhvp0k86MB1oeK0Y7NuTGQSRY6SEna03
         4IRo9QIQRWnp/lAK7pUnBNWAzTn23gyHOoDkkEphUSsvY6TNlG6X2T91RgfFpa7gZMrJ
         6gq8CxCBacjCVYH0sehQNzLTyiSIbMuv+i7IWGZeHH8r96aJGCBehxbwDX7q3zBmCxwj
         Ov/mI8zYaf1dZ62e2IxB9ShJGNVZAuA4cbS1O0t965jwAVvwR8g/thMIVBqH2B82y1Pn
         YiNJuezIWs4UGEiVinmUgpVwQX8EYp+ZXDgi7JgBySlgzCYEaRqp4zQVsgtVOSJki/dd
         TPiA==
X-Forwarded-Encrypted: i=1; AJvYcCUenFCEgVQM0DuF5RroqfPlSmbhJ2BS5U45rR8NIOTdyVW35nSXombaM1Mwvrat3I0O0KM9ETlAqEUx48ej@lists.linux.dev
X-Gm-Message-State: AOJu0YylaXqdYI8glfegwMQ66oqaCwRK4dInAT/ZoS//psU6aj8OmWVR
	TnDegTl29pdDLvJdWxUjjsrFSZiBC92pS5/jIPSEkNriLUVxURY9B7tWkPhm7hDPRXI=
X-Gm-Gg: AY/fxX6MoO57uyHAIVJyL1VM9KY6OigxtM84MLdsRRSYnhAMXPR4KIY6zL9k7rZWGTB
	OLs9Nv1J5PA10mebER3k7YAjODgdPsSKgMJltVyQ5hLkxOalK2Hr2lG4al21JPObUWGWSI0Eywn
	lajhGDHkw4rM+P3XafkvD3DRq84eWq9hRw9gEgDGHdM6zg2AjZ8twY9DLxUFeptCDFK+ZljNmFT
	5RhBMSsGAlM5VDdHQk54TLnOF1mBJqXQsZDRsb6b4NQUIF5A7a0ej1iLbZK9FNwOUGZt9qMsivW
	TbUfRGzSvuK4c5zIqdIkRbUEVMiWGC5Tn+Lcbwx9gbq86A/cglq1LJTFgLHA7nqlOfUiYMLdsuB
	XAAiBktyCFZ/JzH9kwT59oqInepO2F1IQb9+sQCOQjXhGLNGwxqYIDpuccU+e2WKEApeWWR3/XV
	ytHJlMgTarLJcgVPEv
X-Google-Smtp-Source: AGHT+IGZK0K3k2G1O6qKd4QDiCRlFQH4FdI0982zJO/h0JjyXT/OZb5LUVyKeXmP0skYW90GkuYkzA==
X-Received: by 2002:a5d:5f49:0:b0:42b:3dfb:644c with SMTP id ffacd0b85a97d-4324e4c157fmr61584699f8f.10.1767615014831;
        Mon, 05 Jan 2026 04:10:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm99176277f8f.8.2026.01.05.04.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:10:13 -0800 (PST)
Date: Mon, 5 Jan 2026 15:10:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 16/16] fs/ntfs3/inode.c:1024
 ntfs_writepages() error: uninitialized symbol 'folio'.
Message-ID: <202601010513.axd56bks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   099ef9ab9203dff327f2d61e44773f9acbc01f13
commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13 [16/16] fs/ntfs3: implement iomap-based file operations
config: um-randconfig-r072-20260101 (https://download.01.org/0day-ci/archive/20260101/202601010513.axd56bks-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601010513.axd56bks-lkp@intel.com/

smatch warnings:
fs/ntfs3/inode.c:1024 ntfs_writepages() error: uninitialized symbol 'folio'.

vim +/folio +1024 fs/ntfs3/inode.c

099ef9ab9203df Konstantin Komarov 2025-12-26  1002  static int ntfs_writepages(struct address_space *mapping,
099ef9ab9203df Konstantin Komarov 2025-12-26  1003  			   struct writeback_control *wbc)
099ef9ab9203df Konstantin Komarov 2025-12-26  1004  {
099ef9ab9203df Konstantin Komarov 2025-12-26  1005  	int err;
099ef9ab9203df Konstantin Komarov 2025-12-26  1006  	struct inode *inode = mapping->host;
099ef9ab9203df Konstantin Komarov 2025-12-26  1007  	struct ntfs_inode *ni = ntfs_i(inode);
099ef9ab9203df Konstantin Komarov 2025-12-26  1008  	struct iomap_writepage_ctx wpc = {
099ef9ab9203df Konstantin Komarov 2025-12-26  1009  		.inode = mapping->host,
099ef9ab9203df Konstantin Komarov 2025-12-26  1010  		.wbc = wbc,
099ef9ab9203df Konstantin Komarov 2025-12-26  1011  		.ops = &ntfs_writeback_ops,
099ef9ab9203df Konstantin Komarov 2025-12-26  1012  	};
099ef9ab9203df Konstantin Komarov 2025-12-26  1013  
099ef9ab9203df Konstantin Komarov 2025-12-26  1014  	/* Avoid any operation if inode is bad. */
099ef9ab9203df Konstantin Komarov 2025-12-26  1015  	if (unlikely(is_bad_ni(ni)))
099ef9ab9203df Konstantin Komarov 2025-12-26  1016  		return -EINVAL;
099ef9ab9203df Konstantin Komarov 2025-12-26  1017  
099ef9ab9203df Konstantin Komarov 2025-12-26  1018  	if (unlikely(ntfs3_forced_shutdown(inode->i_sb)))
099ef9ab9203df Konstantin Komarov 2025-12-26  1019  		return -EIO;
099ef9ab9203df Konstantin Komarov 2025-12-26  1020  
099ef9ab9203df Konstantin Komarov 2025-12-26  1021  	if (is_resident(ni)) {
099ef9ab9203df Konstantin Komarov 2025-12-26  1022  		struct folio *folio;
099ef9ab9203df Konstantin Komarov 2025-12-26  1023  
099ef9ab9203df Konstantin Komarov 2025-12-26 @1024  		while ((folio = writeback_iter(mapping, wbc, folio, &err)))
                                                                                                             ^^^^^
Uninitialized.

099ef9ab9203df Konstantin Komarov 2025-12-26  1025  			err = ntfs_resident_writepage(folio, wbc);
099ef9ab9203df Konstantin Komarov 2025-12-26  1026  
82cae269cfa953 Konstantin Komarov 2021-08-13  1027  		return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1028  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1029  
099ef9ab9203df Konstantin Komarov 2025-12-26  1030  	return iomap_writepages(&wpc);
099ef9ab9203df Konstantin Komarov 2025-12-26  1031  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

