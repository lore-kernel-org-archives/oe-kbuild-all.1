Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1F019C54E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762074534; cv=none; b=TlEOJisu8mJyVe2o/h6W9fG5MjbUKHkD/0aXHGQDMcyIcwm3gE9vC9RHTrY4erVEdmSrgSwaVP0/ilBwKubVyPG8I/6Yp/UgXoKALwoy9jR5bhhPrwuvn+h/XRrF2ssCJmNh2k8IZI398kkiCtummlDwpn+QU7jjeNPCnyioMRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762074534; c=relaxed/simple;
	bh=7/D/9JuKlda0IizNfN3bJ+LCT/7NPYyYMDu6mmOz2tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LsCkMfarfQZE7wmYIsnFr0gv87vLpiWpgJ2COUmZv5jDzdsCedFoJmppx8YB7FZLzI09arApe+oj9xIMcx0fXozkVbfQG7Za1uqRXm+G3dpk+ISg0nA5fyMN/sN4nA7pzH+oYPWmrNLO1kEnWanlzrrTIX9oZ8HH+yhXFmg+T5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KxYMnSPK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxYMnSPK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so25101955e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762074531; x=1762679331; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gICqRIRyRxEMMN/HX8MILNkO7MD4631S+ctChFJDT7Q=;
        b=KxYMnSPK97kUEVYdd5d88YsalB6md+5yTAM7g+5bZiSOrXYVdjJgpdbN7ZnO3Ulw0v
         jdlkkj5m8LVMI9yn6MLXZLRgh1Sb+8QaLOiD6syYXk1w4+23vlpQO4cnR76PdtRfGs0X
         4l5a2OfTkkMWNSGhh7OzNTb1bIkiZQjYOrF7Qod/q1HX3AibjyNWGUPcSmOvA0fZ/7wZ
         maBom+0tyZGRv2UBLvHJ0w0ncXAIrRMsk3Ui32qRzYFX/NpkdPIRAI19P8i4TqWI7xae
         BJ2Nq/YUj9ega3JwZo/khuAnoloBrmVAX7cz6I4EQkuoi1UPu6HSOi8hfrYB/PHAUies
         9E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762074531; x=1762679331;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gICqRIRyRxEMMN/HX8MILNkO7MD4631S+ctChFJDT7Q=;
        b=PJh9JwvwhfL9+MRqCdIf2b3yVtpuWgWexyWp4x5vYrS1zIcgCXNmMXH7KsIaK+1M+D
         uDbRqKdj6BwU+j8c7/R0rInVS6D0BFpxyqoxOmlo523HQRIMYhZirtPbcA9Yc+w+R5R7
         jGP405kFe+dGEKLFPCVCKQ0S6m/4qhMZU4zZfbD8n4lbn6abfomCigngSZh+lzzNB0q2
         pmWmArpNNsqD4D/bxgYo/b2ky98Iijru3KcgNWHtx168a4JuOPucA9Vz56zcPWc4hAUN
         2ga1/i+4aCbhJKEmA89PyR47XhTv1lnZxmqIOOrenMJiFykSsUaCe8y7wBwZt6BWdBfc
         /Qng==
X-Forwarded-Encrypted: i=1; AJvYcCWQG8uWFlN5Js3LKhhKvk7sAi1aRXk2RBPUV6SAdSZOI1jQy4e+H0GFR6ZfM07Hs+nGIHyvb/cE52d06Nh8@lists.linux.dev
X-Gm-Message-State: AOJu0YwY3wZM+DBU1yKUptPlbm6OpCibKMVzcC9PH1JMtsqSWKuOgJoI
	MUpbKM5j8/eFmpn82ylRrNH6h+gIkXzzO8dy7KnIc9Lqagsw1zc8Ui2CdG8yqI3x/OQ=
X-Gm-Gg: ASbGncvkIHAHT2GaXTixS0mgxbuHp+tyHy5f5Ob83gndxTgZ5o73MzNKM45DSoHUrqA
	WLuD0CAP4iOZs1ficKZbaIpX7ya+UwfgZhrTvVe0CyDh9qHK12Svuj5Ih17a42jdx/6IQSAnHoW
	hTe41XyAWF1rY9jIf57JYWNj+/HYtYEALEqAJnPMHJAn1uYLzMbSw88PHkgJ362yXPUcSTsuFGs
	qeps00czPeWKOn92OfIwIj4pylx1XihQG/mHZVO7GrwEzBTkB6G+Wr+1S6oI77b9vt0KH7w0mC9
	nmW1N0ZZFOpUfSy7zjtoeVpraVk9xFTGJWWHeiMdGoRMukDLsKcKpcb/um31jY6Q+d5K/CAdGnD
	OPlZ77AtrbR9ENCuFP3YCqxG/p+r1H8GgGhc94rUXLw6OD2mbd1RRZg6ezkCdiGOnu5gamGGYN0
	gPTJUo3CjDNDKlEDAh
X-Google-Smtp-Source: AGHT+IGn5bPwV56bsV2deYi9JT5okvhROQmNRKf5EUkUmao9tiHAn5dobVx2xgvTKyZJ700Wv08Crg==
X-Received: by 2002:a05:600c:6218:b0:475:dd53:6c06 with SMTP id 5b1f17b1804b1-477308ec45dmr82695135e9.40.1762074531098;
        Sun, 02 Nov 2025 01:08:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c114be36sm13128018f8f.18.2025.11.02.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:08:50 -0800 (PST)
Date: Sun, 2 Nov 2025 12:08:47 +0300
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
Message-ID: <202511021406.Tv3dcpn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029234353.1321957-5-neilb@ownmail.net>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20251030-075146
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20251029234353.1321957-5-neilb%40ownmail.net
patch subject: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating() and end_creating()
config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511021406.Tv3dcpn5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511021406.Tv3dcpn5-lkp@intel.com/

smatch warnings:
fs/overlayfs/dir.c:130 ovl_whiteout() error: uninitialized symbol 'whiteout'.
fs/overlayfs/dir.c:130 ovl_whiteout() warn: passing zero to 'PTR_ERR'

vim +/whiteout +130 fs/overlayfs/dir.c

c21c839b8448dd Chengguang Xu     2020-04-24   97  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
e9be9d5e76e348 Miklos Szeredi    2014-10-24   98  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24   99  	int err;
807b78b0fffc23 NeilBrown         2025-10-30  100  	struct dentry *whiteout, *link;
c21c839b8448dd Chengguang Xu     2020-04-24  101  	struct dentry *workdir = ofs->workdir;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  102  	struct inode *wdir = workdir->d_inode;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  103  
8afa0a73671389 NeilBrown         2025-07-16  104  	guard(mutex)(&ofs->whiteout_lock);
8afa0a73671389 NeilBrown         2025-07-16  105  
c21c839b8448dd Chengguang Xu     2020-04-24  106  	if (!ofs->whiteout) {
807b78b0fffc23 NeilBrown         2025-10-30  107  		whiteout = ovl_start_creating_temp(ofs, workdir);
8afa0a73671389 NeilBrown         2025-07-16  108  		if (IS_ERR(whiteout))
8afa0a73671389 NeilBrown         2025-07-16  109  			return whiteout;

white out is not an error pointer.

807b78b0fffc23 NeilBrown         2025-10-30  110  		err = ovl_do_whiteout(ofs, wdir, whiteout);
807b78b0fffc23 NeilBrown         2025-10-30  111  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  112  			ofs->whiteout = dget(whiteout);
807b78b0fffc23 NeilBrown         2025-10-30  113  		end_creating(whiteout, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  114  		if (err)
807b78b0fffc23 NeilBrown         2025-10-30  115  			return ERR_PTR(err);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  116  	}

whiteout not set on else path

e9be9d5e76e348 Miklos Szeredi    2014-10-24  117  
e4599d4b1aeff0 Amir Goldstein    2023-06-17  118  	if (!ofs->no_shared_whiteout) {
807b78b0fffc23 NeilBrown         2025-10-30  119  		link = ovl_start_creating_temp(ofs, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  120  		if (IS_ERR(link))
807b78b0fffc23 NeilBrown         2025-10-30  121  			return link;
807b78b0fffc23 NeilBrown         2025-10-30  122  		err = ovl_do_link(ofs, ofs->whiteout, wdir, link);
807b78b0fffc23 NeilBrown         2025-10-30  123  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  124  			whiteout = dget(link);

It's set here, but then returned on line 127.

807b78b0fffc23 NeilBrown         2025-10-30  125  		end_creating(link, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  126  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  127  			return whiteout;;

nit: double ;;

807b78b0fffc23 NeilBrown         2025-10-30  128  
807b78b0fffc23 NeilBrown         2025-10-30  129  		if (err != -EMLINK) {
672820a070ea5e Antonio Quartulli 2025-07-21 @130  			pr_warn("Failed to link whiteout - disabling whiteout inode sharing(nlink=%u, err=%lu)\n",
672820a070ea5e Antonio Quartulli 2025-07-21  131  				ofs->whiteout->d_inode->i_nlink,
672820a070ea5e Antonio Quartulli 2025-07-21  132  				PTR_ERR(whiteout));

whiteout is either valid or uninitialized.  For some reason
Smatch thinks whiteout can be NULL, I suspect because of
the NULL check in dget().

e4599d4b1aeff0 Amir Goldstein    2023-06-17  133  			ofs->no_shared_whiteout = true;
c21c839b8448dd Chengguang Xu     2020-04-24  134  		}
c21c839b8448dd Chengguang Xu     2020-04-24  135  	}
c21c839b8448dd Chengguang Xu     2020-04-24  136  	whiteout = ofs->whiteout;
c21c839b8448dd Chengguang Xu     2020-04-24  137  	ofs->whiteout = NULL;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  138  	return whiteout;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  139  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

