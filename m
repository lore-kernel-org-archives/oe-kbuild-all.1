Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599AC8CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972097; cv=none; b=YUZqKWq/v2Q+9tzJa6A6K+aCkS86Wps5zVzmziv9sfrsMJeVLDZWUGdZZe0Fpro/GB7iF/sDSUNAGD7QZ8IFG98XeFdMi8I2Dt4Z2iTfQmlITEWQiV3wwZcnmoA94kJhmTHpj1yAw/v32k2dm/y+I0RM/M0bJBcGOLyE7wt0Wpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972097; c=relaxed/simple;
	bh=SaQ1F6nNaYjfU8wKuJDSOivziZ7XyPNEp/jfjI43gnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ly1H+sz6Ex57+LUZGhAUn5pfkSSC3n+Zv90rLLGzudEotaA65AT7GFd4ev434QJrukYupOhGenMGV0hNkG2mhxPQXOuaOFWvSgD88kXoCYlRXIwvAWd3ZSHszqig2np8ExL9nQL6HoS+phy6mOdAhfdvdtH+koRc1ynyyejsrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kj4wKKq9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kj4wKKq9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so2238234f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 00:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763972093; x=1764576893; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vtLDjsTRAO6VpgXgyjARdy73rxRwcIofjL8obKYSqVA=;
        b=Kj4wKKq9UZam+pAuK0kc/0t7CkgQw+25vpCk5nYA5cvUkiBPWZt7JL9m3rHhLaWp5N
         IfKVPsQZxULnsWFaAl2eBVQNN2hc5TI6qcE2C2+lvpw8PElC0Mv4JIOIi7vRi/izk9Hx
         1AgLhQ+LQPkQcunHJ8oMF3XnhHicYqTke/UewCkGzuW5s3y7f6/58erN7hbTwcqJGS//
         RsVzDqE3iy1NqLRGpNS2r3RbqWe9LMEQfC+BLBb9t5Q9qfmIPO1ahrsCx/T6kRp8Fana
         pbTqPwAMxufgDIcYnX0P2vpp7gOFhxN2edPtQaQOz64YK0rcp3ZA65Iyj1pgXr2BrShE
         WOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763972093; x=1764576893;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtLDjsTRAO6VpgXgyjARdy73rxRwcIofjL8obKYSqVA=;
        b=rfWmJfyBWGhApmOWJrse6ssDxGWVPTVA52TfT52lxLP1o4aBfGoA1pFSzJARfnmao4
         rpHLmOKW2ysUBDraepXxunuAfSN/x46OEtmpvHeeKfpsQGfMLGAN7fN1CK3TdKZ0Iasx
         gaj1NNdihW/VDhOxG1kmBYheiLXYsWhZItH5Exf4b8WVkqVIwcR6JcA4twhm/Pxof5Fa
         tgFMPHvSDkihVe8pQGYtxNFOKTLT/aQGAVRRDR9wy7f/zBwoqNW5sBrhvt5e9I43lri3
         ODN4lpfUn7twZGznJ7NTsfYp60r1/egMBeK+Q+HKOc9RMqmxjHfA9wzvJAzm3F4f4C69
         lQfA==
X-Forwarded-Encrypted: i=1; AJvYcCXHfk0RGyqbUr7m8FiVONHTdW43MkupRhgLaF4beLoS3K41gejEc3vkR8qfSUaK0AG1XNgoxMAqZdw7XdVH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx37VwGVfAatgmSE3ZEl5pRD7Zoqtr09BILCJz5mvy7XN90ZDXF
	5yuB5ZhbtTeSpCfgpijC+9T3DQxJ34jUHkSGqG1HrgozleZJIeQe8NJE6efa2sRqUlk=
X-Gm-Gg: ASbGncvZEYcVSTkqxlRaaVZ8LiF2vtLJsR+gGUmcw77w/acGn2XS+XdMrL1AOq6bCQd
	98Dz6RvC98e6mEmBUo3VbnMTnu/4CruzVTkHnIybrUddXEGUxHjGUkKORybj5fCnC5t+iOhWhSO
	v2k7dypVrgtsOByJexwXrRsj2LnBycTdVYGLlES8G+RbDD8UEkzdQgfkmIVrJrndsWjmyIthb6o
	2dug95iXNdR71nMEXDPLSR/1aLp97wAez+7tcbPbPYfHBnKsepIS5VGunxWQBIhPTRlZnB0APAx
	f0il3ezJ3aa/tcVvbCtcfY1iINUwrcPCyhElhu31sPdamFaDdCb1iKKLkEaweQnVHpZKsKGsB3V
	U0adQWGWm4a5u9aLJ8fJzZJJBtrjdBgibjRDgWiIZzXAlXFJ6i7xkcDUgTtpjZGwuBK+E37XA23
	9DzKZeQX5OPZnLYaqZ
X-Google-Smtp-Source: AGHT+IE7JElKhz38ZIRYrFlgMyGvoHXk94gbncJ+AbHqFy96TF2SN64s1ckZnKcjnPw9Wryz9AfjyQ==
X-Received: by 2002:a05:6000:1445:b0:42b:5448:7b06 with SMTP id ffacd0b85a97d-42cc1cbce56mr10856001f8f.13.1763972093335;
        Mon, 24 Nov 2025 00:14:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa35b7sm27248997f8f.20.2025.11.24.00.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:14:52 -0800 (PST)
Date: Mon, 24 Nov 2025 11:14:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Luis Henriques <luis@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/3] fuse: implementation of the
 FUSE_LOOKUP_HANDLE operation
Message-ID: <202511232052.lN8GzRFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120105535.13374-4-luis@igalia.com>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Henriques/fuse-initial-infrastructure-for-FUSE_LOOKUP_HANDLE-support/20251120-190106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20251120105535.13374-4-luis%40igalia.com
patch subject: [RFC PATCH v1 3/3] fuse: implementation of the FUSE_LOOKUP_HANDLE operation
config: s390-randconfig-r071-20251123 (https://download.01.org/0day-ci/archive/20251123/202511232052.lN8GzRFA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511232052.lN8GzRFA-lkp@intel.com/

smatch warnings:
fs/fuse/inode.c:1198 fuse_encode_lookup_fh() warn: potential pointer math issue ('fh' is a 32 bit pointer)

vim +1198 fs/fuse/inode.c

c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1182  static int fuse_encode_lookup_fh(struct inode *inode, u32 *fh, int *max_len,
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1183  				 struct inode *parent)
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1184  {
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1185  	struct fuse_inode *fi = get_fuse_inode(inode);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1186  	int total_len, len;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1187  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1188  	total_len = len = sizeof(struct fuse_file_handle);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1189  	if (parent)
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1190  		total_len *= 2;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1191  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1192  	if (*max_len < total_len)
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1193  		return FILEID_INVALID;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1194  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1195  	memcpy(fh, &fi->fh, len);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1196  	if (parent) {
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1197  		fi = get_fuse_inode(parent);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20 @1198  		memcpy((fh + len), &fi->fh, len);

fh is a u32 pointer but len is in byte units so this is a pointer math
bug.  It should be: memcpy((void *)fh + len, &fi->fh, len);

c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1199  	}
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1200  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1201  	*max_len = total_len;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1202  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1203  	/* XXX define new fid_type */
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1204  	return parent ? FILEID_INO64_GEN_PARENT : FILEID_INO64_GEN;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1205  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

