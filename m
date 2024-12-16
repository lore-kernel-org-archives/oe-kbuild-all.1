Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86826157469
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734328222; cv=none; b=AQ8qTv9DwgcxDwL9jd1o2GsAmMcjTbTLRFDKjEbyYzWPsvbeNCFKavelTRPG3ky5NWPXcxunKWU33r8UoPAFrmR9wowlnzyvZOyN8CoPoMmzF7gA85AQndZDU4akOEeB9dUxQLhWkJSIlsMAG9U7qX+eyq7t48ozicR1HFEYi2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734328222; c=relaxed/simple;
	bh=IcGnH8t004287UN7ZxJNzge407cOyGMVrfUVoS2/2dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qcnf5PifgUfsomXcs1SXeWMVpZTaOapOFQ9GHFJQejfjOaQrrvqMCoq+IZmt6TWRJISYSy4eJuuU52453Cs5y3oZW+FEa74hDwqXpo45cPeZSoklYu3wHtXE9B3NMvgsx29mwB6PJDW+/BvUBHVEh0k3Kb029cgOxXGDoi98bJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsKqp4hj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsKqp4hj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa662795ca3so920253866b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 21:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734328218; x=1734933018; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28rBGpNRoHuKeq3OB2jcd9yZDVogG0jSyl/ABKSmORQ=;
        b=rsKqp4hjVly/9UW/XmHec3QIzyEK35vwRQ8W6YD33mo4bXVovIGQdaowHn+pwRrX4Y
         kMlndcEiiJr/OFIFXMLZwgmALBJVBgFDWDhQmE4CHZqg8kDml/UWAW9G4PpoPixmv0h3
         kO08wrNyXLRmszjWbya/KN3ww8XPSm+Tfl78p2PGXdhEq5hWWf32kRutdBW/IaDXlMm4
         KIfovibmYOGm6xliwllwjV58dB1+lyN1CENq+QNy1jRdL8iA0g+oxqzsZVap58qhG+QX
         hmb/KqsuwwcFWNZeJCnMxQ6VSGcvicEwnTJjtZ7RpHmshkyeLtbbyXa8Fj65C9DRiVjL
         /wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734328218; x=1734933018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28rBGpNRoHuKeq3OB2jcd9yZDVogG0jSyl/ABKSmORQ=;
        b=tJ+ouYERHxJwDpRPxcJi3/FeArx+mW/x6869C/ZwhprPiA9AFTBe1HIV5rZ/W+VJOj
         aGNK/Vk1J/faISe8wAoD9tChT6NnArS4weCsKaxqp/q1sUli7kMaccAhD6QOTapPwzwq
         5Q2RQ9KM/0rsOpzi2X2oJb9gjTDGqlW80k/ZUTpviWPxQyR2hl5HmElpJ3rB0sn/l4xs
         MmSGdlFAsAaUjWodyp6rUpWOaIb557rgHw9wyisJ5vq8uWalZOR4yKrLuGG2iqdqlSA1
         cdCQ4qSVAA6Lye1x7lgUajSwoYwDlUoZcsqYgnu2oKt2i1cYT9JK3nQgckDUP83UFICE
         /1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXm2rRDVEnf9+ggTa8EHCYkJDEpp483B8vATYN65m89O1VkHomlH63ZMcz0rB6pjQtfxG+sbkQ/TAkKvJ8R@lists.linux.dev
X-Gm-Message-State: AOJu0YwI1WjK5xQUVkz9bRGEWIGlli66icwJlYsREbzxsQDuEOLYRJOE
	z9ASF15ITKoMbCcTa0R4zh9l4fCm9BKQUn8yzz/mN2P7X5qH2vhzcpNrLL8d6Cw=
X-Gm-Gg: ASbGncshv1X4RbBf5m5IQwUqxH6CuH4I7HE/Movz0JXe1BmAkkLP4Yc9HNQtfZoJxRj
	UNP5exs8QC8+e65XeABQo9wm4q+/+f9JhYhTiBRe8is3DdENwghaBWQ+VwjHAPc/yjXC+BGHsc8
	gu2K55V5XtDRvD2lVqVNjhYzWFqz1t7YPH/C3t9fAC703Mc+SPRSv1241Zd99nrmu9aM0fJazbT
	FfKYfEWFDq+/+b/LrdqLYJKlapc0syncJ4mzwH1uphozipGD4ySy2ezq55Yqg==
X-Google-Smtp-Source: AGHT+IFs7gzxyei2vVv7Low+4jf5kLsNw+WFuhHQ9H8RVuZxu0835oUUhj+ZhUvnhiXHsTBIE3u2wA==
X-Received: by 2002:a17:906:1342:b0:aab:8311:951f with SMTP id a640c23a62f3a-aab8311966bmr1038596066b.6.1734328217957;
        Sun, 15 Dec 2024 21:50:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec32sm284756366b.151.2024.12.15.21.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 21:50:17 -0800 (PST)
Date: Mon, 16 Dec 2024 08:50:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	sanglipeng <sanglipeng1@jd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] fs/udf/file.c:175
 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.
Message-ID: <c7cba3c9-8758-4959-ad4f-78b158d31747@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: a0756b79ccafa25037fa57d5afd50dc12ad230b6 [2579/2579] udf: Do not update file length for failed writes to inline files
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241215/202412150352.4zRZ3ksW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412150352.4zRZ3ksW-lkp@intel.com/

smatch warnings:
fs/udf/file.c:175 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.

vim +175 fs/udf/file.c

d4637bc18f3bf8 Al Viro           2014-04-03  135  static ssize_t udf_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 Linus Torvalds    2005-04-16  136  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  137  	ssize_t retval;
543ade1fc901db Badari Pulavarty  2006-09-30  138  	struct file *file = iocb->ki_filp;
496ad9aa8ef448 Al Viro           2013-01-23  139  	struct inode *inode = file_inode(file);
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  140  	struct udf_inode_info *iinfo = UDF_I(inode);
165f1a6e300d5a Al Viro           2015-04-07  141  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  142  
5955102c9984fa Al Viro           2016-01-22  143  	inode_lock(inode);
165f1a6e300d5a Al Viro           2015-04-07  144  
3309dd04cbcd2c Al Viro           2015-04-09  145  	retval = generic_write_checks(iocb, from);
3309dd04cbcd2c Al Viro           2015-04-09  146  	if (retval <= 0)
165f1a6e300d5a Al Viro           2015-04-07  147  		goto out;
165f1a6e300d5a Al Viro           2015-04-07  148  
8754a3f718f08d Jan Kara          2010-11-16  149  	down_write(&iinfo->i_data_sem);
a0756b79ccafa2 Jan Kara          2023-01-02  150  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB &&
a0756b79ccafa2 Jan Kara          2023-01-02  151  	    inode->i_sb->s_blocksize < (udf_file_entry_alloc_offset(inode) +
a0756b79ccafa2 Jan Kara          2023-01-02  152  				 iocb->ki_pos + iov_iter_count(from))) {
7e49b6f2480cb9 Jan Kara          2010-10-22  153  		err = udf_expand_file_adinicb(inode);
7e49b6f2480cb9 Jan Kara          2010-10-22  154  		if (err) {
5955102c9984fa Al Viro           2016-01-22  155  			inode_unlock(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  156  			udf_debug("udf_expand_adinicb: err=%d\n", err);

Missing up_write(&iinfo->i_data_sem);

^1da177e4c3f41 Linus Torvalds    2005-04-16  157  			return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  158  		}
d2eb8c359309ec Jan Kara          2011-12-10  159  	} else
8754a3f718f08d Jan Kara          2010-11-16  160  		up_write(&iinfo->i_data_sem);
^1da177e4c3f41 Linus Torvalds    2005-04-16  161  
d4637bc18f3bf8 Al Viro           2014-04-03  162  	retval = __generic_file_write_iter(iocb, from);
5f380c7fa7e01f Al Viro           2015-04-07  163  out:
a0756b79ccafa2 Jan Kara          2023-01-02  164  	down_write(&iinfo->i_data_sem);
a0756b79ccafa2 Jan Kara          2023-01-02  165  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB && retval > 0)
a0756b79ccafa2 Jan Kara          2023-01-02  166  		iinfo->i_lenAlloc = inode->i_size;
a0756b79ccafa2 Jan Kara          2023-01-02  167  	up_write(&iinfo->i_data_sem);
5955102c9984fa Al Viro           2016-01-22  168  	inode_unlock(inode);
09ebb17ab476b6 Jan Kara          2014-02-18  169  
09ebb17ab476b6 Jan Kara          2014-02-18  170  	if (retval > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  		mark_inode_dirty(inode);
e259221763a404 Christoph Hellwig 2016-04-07  172  		retval = generic_write_sync(iocb, retval);
09ebb17ab476b6 Jan Kara          2014-02-18  173  	}
28de7948a89676 Cyrill Gorcunov   2007-07-21  174  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @175  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

