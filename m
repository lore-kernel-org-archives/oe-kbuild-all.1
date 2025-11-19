Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAC3587AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554451; cv=none; b=Cv+t9jpHfj/5dCcS0uoqro0wY+UeXZIFXtAQ4vfZLEl8CZ8+5TxeshwZ+rKCCxcLrCsjIEhg1c7dvT6J94yLeymmy3nXBKHsHrZNLPrYZLlEW6TKWb5y3cR2tczeL2Kjftz4b8hqZODHmh4fh8TIIgY6qtaQiHQebvbNNKzzKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554451; c=relaxed/simple;
	bh=u6JRcyowVqocvgdM44XVbi9CoQr4x8Fe/s0T9I1pHcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzCUPvlP27fVnqkIiZGm2zN9SXKbHEvXlyF5p8VmKtBrK8qhYMgqx7epVsfcODjcYaszoh616Kw2L+3U2GpiIfGXZ4jqoKVK7BK8/5L90RM9MrGgQMHqxu4ZrvDQAgH9B5MxwvU6OKJ3z3wOO2T/Cwg0WMDsEZIpLfwRQNXTxtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYrtOY+v; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYrtOY+v"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso46507295e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 04:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763554447; x=1764159247; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAUQqCxumRQ+S977f7VzgntD6gNrDFR/u6H2gkxTfjY=;
        b=cYrtOY+vLPlIpnkqtEsrGBU8C0ys19tQB5sHjI80mhpEml+naSJ3HiBGLywenOjoyx
         FPdfswr2pcL+SUjq8RsMbCfHdoTrXcuHebs+iiJwOjnscOit+RgbGCRvM/2V3URxmoJH
         zvsb0u+jk74w9omviDZH/RE0gH+/LdNyqwkUoVOrpZQ3ulz2p3fNp/9fpB6iRrSNNYS0
         SblQi4stIz5f3Mo8HzuDADUAGwiww3LKh2NakfTLv5LuUvRSK8kkVgzYVGMJIItTsfjG
         bluLLYDQJUwVDAOPcvKes+2EBCoJa0AufnYpgYv22IViEYegmAHtuofWNpZ4DiJvnSHu
         K70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763554447; x=1764159247;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAUQqCxumRQ+S977f7VzgntD6gNrDFR/u6H2gkxTfjY=;
        b=KphZ5HoRjsSwVexTzPS6bde6dIuxCBvgD5UvRfDGvhLuomwWJsZHAJb+f0EQbIXJSF
         q8WxafnlBKEG+TuyBj1scsdKXY5uIffdTEYABHXM9B8CZJW5O812kHzl0aj2dJyENFM1
         pAd7pWckLVNzujNDPSkgRIFb0ARWfIw4ISXW1A2lRTalFMm7QpBK+a4/WxZ87GLoc49T
         bnyszzL14LnDdX+L2qlk9ZrOUI4Gk0V3difcyv+nwYqOMimvjqF5fHr65dry1QpjbHAL
         q3EozfDTj8m1fxQEYX31jXAfcy/YyrJOxoxONHBeaqSpPKJ5jNKvvZvI1Pukq7vGJzQs
         t2hg==
X-Forwarded-Encrypted: i=1; AJvYcCWX3zz89eOC6KyOFhrwQZE3/uLdu4nDvrKxrFQifPQPW0PbCnUVJj+t3f38+V59HrRrGhohv9CnPPHXPd8J@lists.linux.dev
X-Gm-Message-State: AOJu0YwDlvnCE7g6eDAzPU3Xf7jsssQeNlcenXeEZjEOL2D4QAnx0p8k
	22aZWCKAaF/QckwOoJf0QBiGDK1LBp/lsj/AXtrpdMe/0TbpS2PWm6w8jQ/D8FJeE44=
X-Gm-Gg: ASbGncuP/v2BGKRZ55upU4LPJjItmFQvDlbibWcLNJhlAlt0dZVUaY/diJ4b4MoqY5/
	/DdJBAf89HgfjfLUfojoTpLrt0QZ3v34BbxYqa/MWKibf+YIQD3vffyzpJiUj7DEYIfViq0DPFm
	ZrR9j7mljyEDksPHzyw0pYroANG3LmsQCEUQgVJRrCaFJage7wFeGoiwBghXtaFguCknPIPHgOi
	nMTmj3EhacRIPWsOo68MVpAekw2hEDIa7sWCMfmkJiuNEnh5G8E6QLkHRVgdgAw95daOfUAx9aQ
	GLdErMdUwayaNa0MO2/kHZTDOitd5WcJik1fiNnSUhGi2ptdnepmBvW90LlPD4ck0KUd0mNQ9cW
	xW0Phi+Ql+JsIYUWZuEOFDpokBFq1f4VxvfVH/8dmEKQqo7U8+JoCCxyAAI9dcpJbQOBJtKmO/g
	Oh5u2kYe4dnLmIZ1htF12Ssw+0xGE=
X-Google-Smtp-Source: AGHT+IEYacgEwKb0LeR0JgEJABuusiKsbIIkQxyEko6LzSSz8Bj8aVFgS/T0iuZtrTAC/Dc38NJR4A==
X-Received: by 2002:a05:600c:5252:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-477b19e236amr19970065e9.26.1763554446773;
        Wed, 19 Nov 2025 04:14:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a96aafb3sm41205465e9.0.2025.11.19.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:14:06 -0800 (PST)
Date: Wed, 19 Nov 2025 15:14:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:work.ovl.cred.guard.prepare 29/53]
 fs/overlayfs/readdir.c:871 ovl_iterate_merged() error: uninitialized symbol
 'err'.
Message-ID: <202511150158.sb6MRtZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard.prepare
head:   6adfde0460758ff27a5d5cfd05c0cfada7070e1a
commit: 723ebc8013726565be4117240fbda90c25d3e4b5 [29/53] ovl: refactor ovl_iterate() and port to cred guard
config: mips-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251115/202511150158.sb6MRtZf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511150158.sb6MRtZf-lkp@intel.com/

New smatch warnings:
fs/overlayfs/readdir.c:871 ovl_iterate_merged() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/readdir.c:1022 ovl_dir_fsync() warn: 'realfile' is an error pointer or valid

vim +/err +871 fs/overlayfs/readdir.c

723ebc80137265 Amir Goldstein    2025-11-13  835  static int ovl_iterate_merged(struct file *file, struct dir_context *ctx)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  836  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  837  	struct ovl_dir_file *od = file->private_data;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  838  	struct dentry *dentry = file->f_path.dentry;
4330397e4e8a66 hujianyang        2014-12-11  839  	struct ovl_cache_entry *p;
b5efccbe0a12a9 Amir Goldstein    2017-05-11  840  	int err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  841  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  842  	if (!od->cache) {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  843  		struct ovl_dir_cache *cache;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  844  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  845  		cache = ovl_cache_get(dentry);
48bd024b8a40d7 Miklos Szeredi    2020-06-02  846  		err = PTR_ERR(cache);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  847  		if (IS_ERR(cache))
723ebc80137265 Amir Goldstein    2025-11-13  848  			return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  849  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  850  		od->cache = cache;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  851  		ovl_seek_cursor(od, ctx->pos);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  852  	}

If od->cache is true

e9be9d5e76e348 Miklos Szeredi    2014-10-24  853  
4330397e4e8a66 hujianyang        2014-12-11  854  	while (od->cursor != &od->cache->entries) {
4330397e4e8a66 hujianyang        2014-12-11  855  		p = list_entry(od->cursor, struct ovl_cache_entry, l_node);
b5efccbe0a12a9 Amir Goldstein    2017-05-11  856  		if (!p->is_whiteout) {
bc8df7a3dc0359 Alexander Larsson 2023-08-23  857  			if (!p->ino || p->check_xwhiteout) {

And these conditions are always false

bc8df7a3dc0359 Alexander Larsson 2023-08-23  858  				err = ovl_cache_update(&file->f_path, p, !p->ino);
b5efccbe0a12a9 Amir Goldstein    2017-05-11  859  				if (err)
723ebc80137265 Amir Goldstein    2025-11-13  860  					return err;
b5efccbe0a12a9 Amir Goldstein    2017-05-11  861  			}
9011c2791e63fc Amir Goldstein    2021-04-26  862  		}
bc8df7a3dc0359 Alexander Larsson 2023-08-23  863  		/* ovl_cache_update() sets is_whiteout on stale entry */
9011c2791e63fc Amir Goldstein    2021-04-26  864  		if (!p->is_whiteout) {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  865  			if (!dir_emit(ctx, p->name, p->len, p->ino, p->type))
e9be9d5e76e348 Miklos Szeredi    2014-10-24  866  				break;
b5efccbe0a12a9 Amir Goldstein    2017-05-11  867  		}
4330397e4e8a66 hujianyang        2014-12-11  868  		od->cursor = p->l_node.next;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  869  		ctx->pos++;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  870  	}
48bd024b8a40d7 Miklos Szeredi    2020-06-02 @871  	return err;

Then err could be uninitialized.

e9be9d5e76e348 Miklos Szeredi    2014-10-24  872  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

