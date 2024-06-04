Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1314AD2B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528242; cv=none; b=EHXHzyS7Z+RU8WMQhnmGlHEjpkuvw7gzxWlsdlBfu7QGIMeLYF9zf5R9HoPIaNrWDNFKh6eBj0VhAmrldoJ7GAdD6wx4JjvuXMguRW5v5/Mq1M0gT0Q/sBpxE63Nlbv7puAcMjlbb3awvSxsaHR/RyIaUJaV8d5LkVlz33ufLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528242; c=relaxed/simple;
	bh=6WRhNvMputCmUE8KuRCNypytBhygsDlUsvmXPlqiqT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=g5BX9BU/WGnPHA4aC9jQ9hFKiEnxWrsJmkCktsN3lBkHvYTyxmu4GKA/X7qUd0Y4RKfWVVBz1M1ZAeR08UwprVfMyRvYR9B959fmhwT49pX/qhIVjAYuFKLIMzT0/iDG3MMHTe8dxf6uY4Z1NNdKqG/urJSwjqRDMqyWV8Uz9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoPuRkzw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoPuRkzw"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so6741521a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Jun 2024 12:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717528238; x=1718133038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzA8SRe4whRjxMfh3T9fimsp/JqPLwi91HrTpjRxV+U=;
        b=MoPuRkzw17CKCjeCITpTrDlOO2ztjRWTUIGYrdtnhwDRd1Xbpn7ynULd+xxblmx3NB
         3txM/Zl5DEraPoi0nlx+ZNcrRTwNo0+QBCSvZXNs/jS/1YPIeDJFhk7Y1LBOeAmBGwBB
         UUheieGLmyex8ZXUOiDhQL/WYkLs1d9N097yCSuDRJ1E6M7c9g9F+bpt9bG88ABg4Mym
         8cfoK7LP7YyvGtG9DMPQdVbIS+ZfFUNFZ6mXo/0WX44tB57ue2tK4NhWGonPku0bmS+p
         LQ2zaDKl/eFqlmxXi77vkRP8fjAIoRO5io4vED7LVXJPINh3Akt6sFwAIXgWW24YJ/UH
         FUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717528238; x=1718133038;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzA8SRe4whRjxMfh3T9fimsp/JqPLwi91HrTpjRxV+U=;
        b=b0tOD/uUaYaYcFYK+ynJe7u10D08lMQosbiEEmWfuwJp2enMLN7AFpS6m90ElFvcJY
         x9luJ0YILT8zzQVXWQpUtKo62DOweFpdWTZRJbHVg0Q81ygWY1va9yvWgFgcOji9sYGY
         O004UCbVPPxPa6uELMAWqnrMXggC3EEUW94tgXG/ImIkyLMK8kiqgcFrpjuD+/+J9O2T
         CKxQVfq22fHrvUHGK6wiEAmDT5wYwMDXT+KPOGkFkZb9jEJYUUxJZ0JGw67XJ7LqMGcx
         yZie/KWUpbtCUbtaXM8oqw0RZSOwDRnooYttvCHO85TlDXTI1f7y+m8EjwzG84Q8mmgo
         TGoA==
X-Forwarded-Encrypted: i=1; AJvYcCUsmoLJSVJZJWZJ56k0KzvirqrJEz4QsFytZjS63nG81Y/KqhvQV1xr/UXO7dppGvg1eoAyC6HWCxo83fr1b88jjlG4FrJTh488qht4Yw==
X-Gm-Message-State: AOJu0YyK0+gZ9UyYg8fgH8NahD9uqwHnH5LduRkIburT7oP1ys86vowr
	mKoIh9wP7L/o6SVQneLa/SscmHQ0M8trBKtGRubIiHLcDE13gSupkS+Ume49IrE=
X-Google-Smtp-Source: AGHT+IGlsLGfRHK0f6DmqF44S64KIFY4M3R+3mRgGUK5rWCZG7z77L7iKZ+bC3jDwWK1rj3XV48eRQ==
X-Received: by 2002:a50:d4db:0:b0:57a:242e:806b with SMTP id 4fb4d7f45d1cf-57a8b6acd8emr362804a12.18.1717528237801;
        Tue, 04 Jun 2024 12:10:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb825esm7847800a12.32.2024.06.04.12.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 12:10:37 -0700 (PDT)
Date: Tue, 4 Jun 2024 22:10:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hyeonwoo Cha <chw1119@hanyang.ac.kr>,
	david.sterba@suse.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, aivazian.tigran@gmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	tytso@mit.edu, adilger.kernel@dilger.ca,
	hirofumi@mail.parknet.co.jp, sfr@canb.auug.org.au,
	chw1119@hanyang.ac.kr, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH v2] Fix issue in mark_buffer_dirty_inode
Message-ID: <97ac9280-4c7b-4466-9cb8-2a81882f0b80@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604060636.87652-1-chw1119@hanyang.ac.kr>

Hi Hyeonwoo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyeonwoo-Cha/Fix-issue-in-mark_buffer_dirty_inode/20240604-140958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240604060636.87652-1-chw1119%40hanyang.ac.kr
patch subject: [PATCH v2] Fix issue in mark_buffer_dirty_inode
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050218.U7c0DL3C-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406050218.U7c0DL3C-lkp@intel.com/

smatch warnings:
fs/buffer.c:673 mark_buffer_dirty_fsync() warn: if statement not indented
fs/buffer.c:682 mark_buffer_dirty_fsync() warn: inconsistent indenting

vim +673 fs/buffer.c

73295b4ed00de6 Hyeonwoo Cha            2024-06-04  667  void mark_buffer_dirty_fsync(struct buffer_head *bh, struct address_space *mapping)
^1da177e4c3f41 Linus Torvalds          2005-04-16  668  {
abc8a8a2c7dc7b Matthew Wilcox (Oracle  2022-12-15  669) 	struct address_space *buffer_mapping = bh->b_folio->mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  670  
^1da177e4c3f41 Linus Torvalds          2005-04-16  671  	mark_buffer_dirty(bh);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  672  
73295b4ed00de6 Hyeonwoo Cha            2024-06-04 @673  	if (bh->b_assoc_map)
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  674          return;

The code is okay, but the indenting is messed up.

73295b4ed00de6 Hyeonwoo Cha            2024-06-04  675  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  676) 	if (!mapping->i_private_data) {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  677)     	mapping->i_private_data = buffer_mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  678      } else {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  679)         BUG_ON(mapping->i_private_data != buffer_mapping);
^1da177e4c3f41 Linus Torvalds          2005-04-16  680      }
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  681  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17 @682)     spin_lock(&buffer_mapping->i_private_lock);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  683      list_move_tail(&bh->b_assoc_buffers, &mapping->i_private_list);
58ff407bee5a55 Jan Kara                2006-10-17  684      bh->b_assoc_map = mapping;
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  685)     spin_unlock(&buffer_mapping->i_private_lock);
^1da177e4c3f41 Linus Torvalds          2005-04-16  686  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

