Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AE9265CBE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762074644; cv=none; b=bQ3Im2C3v7EAgpE5T3rX26KN0WSf4bhhlUdoOOVi1pPAmqL8lyil2XIq1f4Beq3ZCxuRB+GSpBS2l5ybKWqyQblMsQrSrXVIYRIaLnXf+G79ygzG/IYJ5v6jVA6MH21B0FCJPEjrH/6jPTJ4Iq0lAv9bAvqb7OHGV3Tgjn0ETkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762074644; c=relaxed/simple;
	bh=qD5/FoCTLkyARa5AQA/+l/GmKs4cQP/TjyJXRCDh7V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryns+WQbdMMInlIfIMZLrt2SNzBpICus7vZ71H6T8iOJMZE3QmcCu8SYg8/5gGuJ7hdN1gTl4dzztF1sEtRSXXSz1+mibXA+hLNlQe4bTbDsOuw5YNVmxpJw135CCTXv+xH56Zc2QMAn7McaGiSmMiwIdQ9DfDyZLRwN45AoeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdPFoWPU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdPFoWPU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477442b1de0so4154755e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 01:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762074641; x=1762679441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7cGnlggGwCStKE++4amSGBWkBioEl4HVTFZyJlNXgM=;
        b=YdPFoWPUkO7Mrrw5ahpjSwtCb6B+yxPkMHRig6bYHPCETqC0Ee6VvQuShjqLvrXKzs
         1w4zcJW0DW/hxP9rvG2IS4wdx4QO6nn4u2tzH9eV5OtRZriy+/KvwnljjpebQ4eTZcQS
         JE7MN16Nn+ELo+oZhaTUIJDCz0ueXLSTOG0MU3iaq+5zwW+ZaU6J6XBDUgkEgqRscbr0
         e+lqn1rsWYSms69xV1BNDMNg1XqkVJdyWmTNAkjw/sfoN5EA8ufYtItK5afIxVnriJQA
         CzQRxxH9VaaJ6JyBNBUtvg3hD2dHtFN6ndNA3SbLhRqK2UHLh/t7+t9eN+eAxe9Z1sf5
         24uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762074641; x=1762679441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7cGnlggGwCStKE++4amSGBWkBioEl4HVTFZyJlNXgM=;
        b=qTb2q96bQj8D9H0r47d1JfJegbs5+vqVtoZBR4TlsrcmhCO8K45PQAW4rXo0Ih61ka
         wFSbnlTsFfNMbZMDv9z5JljiGSjHT7WChw4F283qZ06sD8SYz4QYSrbgOj++jDbpWi0i
         nVlsGOHv+kjvss2UALFHm2PejwrFrzyurPVcVzzDuU1upwKyiV3yE+lnUSa4tSdBVhm3
         3QV5Ye7PbS2OKxJPBji1XQnLxqLEZTaiH5DIi2/VN4s/0Ea02ey67PUh/KZwav+lNnNt
         edAfebOgxEYRyVb3aggFBEWKTdXBnGAi7I/mKHh/JwkObn4Z6UuFKBScFWeYxsHPoNZe
         cm6w==
X-Forwarded-Encrypted: i=1; AJvYcCVV0eUO1ZyajSCGLTXw9GiSweLvu41X6qof8cEFAd7Q8pLK7usgGD6G8O6yJfpgALYJMU2K90m3+1vLs5Wm@lists.linux.dev
X-Gm-Message-State: AOJu0YygIFMuqZ1/PzBGKM03dz3dnUNqh2izZq+7Sdf6e1k1GnpRszvo
	d4yDVbp5IEY5N4Y9lafV7LpZBd6Pw/1HTv88PRiJK23VNiLxldcB07uBMhcoe6IuZFo=
X-Gm-Gg: ASbGncv/ffbixdN53J6PPd1E0S44M3DGyFYoMDiSBNNfd7Vbqe4mY+rIKgbcbFpGMvv
	YWluzvLqq9FebzVENxJyM2ixlPMDnxhF2earRIh0/CtAOnxEPSP8INVCoprdId/1T7tUBonPWRr
	O+CyF2yFofHUX0AOJ0lfF/SEvv3wxzkNUuuo5tApeUwn6r0WNjc0DIUssrYLEobJZigOKOb2I6M
	tacumzk6Xq9+4cET4jve6gskWU2EDqMFq9wPjBh0CB9S+wNp9jOflwWceMtTTljhxL/38mn1MuO
	UiQUs/0S96bmlY/2rkPYbR2Zc4F9L5mlCYEv8XNl0sHIDIQIltyLBxjij42cgfLBmiZq1WWeIDk
	4hcvLG0HxQhz9q4s4zQHJFqgZG/tEK0qgoJ0UfBJm9YYnUUjyFhPTpyTlcYPMNbDEMrXXDh3+rF
	KBWtfv5eOdt4FjI8nG
X-Google-Smtp-Source: AGHT+IECHyILSrbd0QXTTRGviLOb/cK2qhNsm2Df6/6M1eVjARvdq8vgt6DKUnfZZFhEiuN3prCXvw==
X-Received: by 2002:a05:600c:828c:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-477308a8967mr82981805e9.36.1762074640521;
        Sun, 02 Nov 2025 01:10:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c6ac1645sm8714761f8f.12.2025.11.02.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:10:40 -0800 (PST)
Date: Sun, 2 Nov 2025 12:10:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, NeilBrown <neilb@ownmail.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Chris Mason <chris.mason@fusionio.com>,
	David Sterba <dsterba@suse.com>,
	David Howells <dhowells@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Tyler Hicks <code@tyhicks.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Chuck Lever <chuck.lever@oracle.com>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Namjae Jeon <linkinjeon@kernel.org>,
	Steve French <smfrench@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Carlos Maiolino <cem@kernel.org>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating()
 and end_creating()
Message-ID: <aQcgDOjZqJqkKNXa@stanley.mountain>
References: <20251029234353.1321957-5-neilb@ownmail.net>
 <202511021406.Tv3dcpn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511021406.Tv3dcpn5-lkp@intel.com>

On Sun, Nov 02, 2025 at 12:08:47PM +0300, Dan Carpenter wrote:
> Hi NeilBrown,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20251030-075146
> base:   driver-core/driver-core-testing
> patch link:    https://lore.kernel.org/r/20251029234353.1321957-5-neilb%40ownmail.net
> patch subject: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating() and end_creating()
> config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511021406.Tv3dcpn5-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511021406.Tv3dcpn5-lkp@intel.com/
> 
> smatch warnings:
> fs/overlayfs/dir.c:130 ovl_whiteout() error: uninitialized symbol 'whiteout'.
> fs/overlayfs/dir.c:130 ovl_whiteout() warn: passing zero to 'PTR_ERR'
> 
> vim +/whiteout +130 fs/overlayfs/dir.c
> 
> c21c839b8448dd Chengguang Xu     2020-04-24   97  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
> e9be9d5e76e348 Miklos Szeredi    2014-10-24   98  {
> e9be9d5e76e348 Miklos Szeredi    2014-10-24   99  	int err;
> 807b78b0fffc23 NeilBrown         2025-10-30  100  	struct dentry *whiteout, *link;
> c21c839b8448dd Chengguang Xu     2020-04-24  101  	struct dentry *workdir = ofs->workdir;
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  102  	struct inode *wdir = workdir->d_inode;
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  103  
> 8afa0a73671389 NeilBrown         2025-07-16  104  	guard(mutex)(&ofs->whiteout_lock);
> 8afa0a73671389 NeilBrown         2025-07-16  105  
> c21c839b8448dd Chengguang Xu     2020-04-24  106  	if (!ofs->whiteout) {
> 807b78b0fffc23 NeilBrown         2025-10-30  107  		whiteout = ovl_start_creating_temp(ofs, workdir);
> 8afa0a73671389 NeilBrown         2025-07-16  108  		if (IS_ERR(whiteout))
> 8afa0a73671389 NeilBrown         2025-07-16  109  			return whiteout;
> 
> white out is not an error pointer.
> 

I meant after this return statement...

regards,
dan carpenter

