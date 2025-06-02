Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F73FE4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 06:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847162; cv=none; b=QXgL/OJs+WbIKHvLfAPhMaTLE9pyao8pV/CIkQBIEQOBBdF4YZrTQvvhY+QeEgvZOMCFaUUPpo74lF4bcRS60MLYucfNQdNMrZzIZ6AjJ1Ne+SF9DuRRWcaJ07b837ch8c4MNNsih47Ks5TYKY5fSqCMaFRc4kY0WZy/GMHkGyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847162; c=relaxed/simple;
	bh=0hym0BUS6jqerOB7zJMdIZF+E/EaLTB3aGzU8g4MyQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl2faIdkW65l4BhC3Ot6Mdl2WWe++4ubb12drHdzje9VdaTKCxJrdhn3cjUsNPhEVgLy4+pNfdIzFDLQ0re9sgt5R4AaH/YZfWogicshSmg6mSehEKG9tiSzBwDer+oLFBxTyGu4qGotlAGj1cQJzQ2fSdEKuCmYqI0hB4nA/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c49nftGH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c49nftGH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ce671a08so24703815e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Jun 2025 23:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748847159; x=1749451959; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJx76R+q+RUB6GwJbjfN8d8kPj+Gd8DjvzSAAAVToQE=;
        b=c49nftGHllzv+pJuXJ7Rcop53MAoM90Cw8JR/DOcrjS2DkGdoVI2/9A3nS+BOLTgAl
         fY5CWvI0B67Tza+O65Xa/F/9Rc17VRKkIZifPeMY2w/IujtVh9ykLqZdctJQZvtPsyKe
         oi2Re7XEG4gXQKPpRq1kiq//pX/nkb28kXQ1M3Jkpx/olXE7FJc69W+VbQchKmuUJRBw
         dLT2j2TOXblAahV0KYbL3C7/YvSkzDHSCTJXwm4hyFWsl0FB4dBTVfpnB4LW5BlW3Lzp
         nMNmWa8+liVSKdKnOEtf99NQZ+/T8c/x6bYwx921dg6bdqYjqDvwoUOMhzodMnuA1PB8
         938Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748847159; x=1749451959;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJx76R+q+RUB6GwJbjfN8d8kPj+Gd8DjvzSAAAVToQE=;
        b=YRvKff0LFF1I1uhsmR7lXm24X/810zr2CUgpuPHYHOZbzqnyEz9inOe5bFIi79rkFW
         /kgo3ll4Gn3BpgmDBWZjIx1bt2lR/APqxZafOWhroulkiNOa98JKs5M2j3ROJsABa2JH
         Vu6yDl/LrGk3C47D7mi9eAkNJci48asgd0zrnpuMv3mjj8AvYxcBiQTu7z8zFO1750iS
         RNfbfh/apInFiD36gDc/lUGbhDaT0TT35DMPhgqMb3yUQyfFqGOiz4H7AgG1m2qXM6W4
         k/1DNYKd0m7o9T9/NJ6CshrqMtDH8pvqwqaNON5QSlzrvTf22hHlqX31PdD30O5aYEbd
         oy5g==
X-Forwarded-Encrypted: i=1; AJvYcCVwnLfeGRhVi0kVAR/SkDqQZ2Bz0BexEDNRWr6RKSIeH7Xy31YgL/RWMvVrPoKCByUysCtOv0dHeNjHxkjM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgd1ZOf9KbDr30EE+kx/ElM1tKBYyHI6xO8C/hNvA1inYDVbso
	CU3N2nJJ5Ouz4z9A2fGW7Z4uYlubUGTMY58LCHEKoeR15kFdq4CPWpjixTTh86SxJ4I=
X-Gm-Gg: ASbGnctjdlpCqSGWcmBuDJ0Ljd0MFNlL/Z7EFo3axb4O31Vq829vkvQt9a8OUcF3zgy
	JtpSVMQoLIfDXFp8ndpNSeTkM9xRSwT2uDVi/CoYxXOK9ubQ6xlwPPz3eb0A7XlyTHfArMR9oAV
	Ln+PGQPU8Su5DsT0zDaBOzF8E4ssUy7/Xq1N+WIvsPK/uhvTFbXbLaxpEvEeDPJnb0ENeovqRWA
	oun1Jj/EGXCUtRv8lBXao79XBPrJpw4dZvH65xUwCjvDk7MdXb9Wqcz/Mh1vOROy/S2G4l/6K3u
	fbPrXTSl5vBtYHpAnLOlEMYb+kaBME6Bo82y6ZBZJ+OExKifY+LzE15UeQU/wtpQXA==
X-Google-Smtp-Source: AGHT+IFelW6nd6xGMcrwxtWYEh6cXGsGvk80xK1pRJRECj4EukgRTyKQBMfM6jZRfmit/zkfAHS5lQ==
X-Received: by 2002:a05:6000:381:b0:3a4:eec5:441c with SMTP id ffacd0b85a97d-3a4fe399495mr5417023f8f.47.1748847158915;
        Sun, 01 Jun 2025 23:52:38 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d800671csm110334925e9.30.2025.06.01.23.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:52:38 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: net/netlabel/netlabel_kapi.c:1200 netlbl_conn_setattr() warn:
 inconsistent returns 'rcu_read'.
Message-ID: <202506010920.TbxfWuYH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cb6c8af8591135ec000fbe4bb474139ceec595d
commit: 6e9f2df1c550ead7cecb3e450af1105735020c92 calipso: Don't call calipso functions for AF_INET sk.
date:   4 days ago
config: i386-randconfig-141-20250601 (https://download.01.org/0day-ci/archive/20250601/202506010920.TbxfWuYH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506010920.TbxfWuYH-lkp@intel.com/

smatch warnings:
net/netlabel/netlabel_kapi.c:1200 netlbl_conn_setattr() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +1200 net/netlabel/netlabel_kapi.c

014ab19a69c325 Paul Moore        2008-10-10  1129  int netlbl_conn_setattr(struct sock *sk,
014ab19a69c325 Paul Moore        2008-10-10  1130  			struct sockaddr *addr,
014ab19a69c325 Paul Moore        2008-10-10  1131  			const struct netlbl_lsm_secattr *secattr)
014ab19a69c325 Paul Moore        2008-10-10  1132  {
014ab19a69c325 Paul Moore        2008-10-10  1133  	int ret_val;
014ab19a69c325 Paul Moore        2008-10-10  1134  	struct sockaddr_in *addr4;
ceba1832b1b2da Huw Davies        2016-06-27  1135  #if IS_ENABLED(CONFIG_IPV6)
ceba1832b1b2da Huw Davies        2016-06-27  1136  	struct sockaddr_in6 *addr6;
ceba1832b1b2da Huw Davies        2016-06-27  1137  #endif
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1138  	struct netlbl_dommap_def *entry;
014ab19a69c325 Paul Moore        2008-10-10  1139  
014ab19a69c325 Paul Moore        2008-10-10  1140  	rcu_read_lock();
014ab19a69c325 Paul Moore        2008-10-10  1141  	switch (addr->sa_family) {
014ab19a69c325 Paul Moore        2008-10-10  1142  	case AF_INET:
014ab19a69c325 Paul Moore        2008-10-10  1143  		addr4 = (struct sockaddr_in *)addr;
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1144  		entry = netlbl_domhsh_getentry_af4(secattr->domain,
014ab19a69c325 Paul Moore        2008-10-10  1145  						   addr4->sin_addr.s_addr);
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1146  		if (entry == NULL) {
014ab19a69c325 Paul Moore        2008-10-10  1147  			ret_val = -ENOENT;
014ab19a69c325 Paul Moore        2008-10-10  1148  			goto conn_setattr_return;
014ab19a69c325 Paul Moore        2008-10-10  1149  		}
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1150  		switch (entry->type) {
014ab19a69c325 Paul Moore        2008-10-10  1151  		case NETLBL_NLTYPE_CIPSOV4:
014ab19a69c325 Paul Moore        2008-10-10  1152  			ret_val = cipso_v4_sock_setattr(sk,
8ec9897ec2e93a Davide Caratti    2024-05-10  1153  							entry->cipso, secattr,
8ec9897ec2e93a Davide Caratti    2024-05-10  1154  							netlbl_sk_lock_check(sk));
014ab19a69c325 Paul Moore        2008-10-10  1155  			break;
014ab19a69c325 Paul Moore        2008-10-10  1156  		case NETLBL_NLTYPE_UNLABELED:
014ab19a69c325 Paul Moore        2008-10-10  1157  			/* just delete the protocols we support for right now
014ab19a69c325 Paul Moore        2008-10-10  1158  			 * but we could remove other protocols if needed */
ceba1832b1b2da Huw Davies        2016-06-27  1159  			netlbl_sock_delattr(sk);
014ab19a69c325 Paul Moore        2008-10-10  1160  			ret_val = 0;
014ab19a69c325 Paul Moore        2008-10-10  1161  			break;
014ab19a69c325 Paul Moore        2008-10-10  1162  		default:
014ab19a69c325 Paul Moore        2008-10-10  1163  			ret_val = -ENOENT;
014ab19a69c325 Paul Moore        2008-10-10  1164  		}
014ab19a69c325 Paul Moore        2008-10-10  1165  		break;
dfd56b8b38fff3 Eric Dumazet      2011-12-10  1166  #if IS_ENABLED(CONFIG_IPV6)
014ab19a69c325 Paul Moore        2008-10-10  1167  	case AF_INET6:
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1168  		if (sk->sk_family != AF_INET6)
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1169  			return -EAFNOSUPPORT;

Need to call conn_setattr_return() so goto conn_setattr_return.

6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1170  
ceba1832b1b2da Huw Davies        2016-06-27  1171  		addr6 = (struct sockaddr_in6 *)addr;
ceba1832b1b2da Huw Davies        2016-06-27  1172  		entry = netlbl_domhsh_getentry_af6(secattr->domain,
ceba1832b1b2da Huw Davies        2016-06-27  1173  						   &addr6->sin6_addr);
ceba1832b1b2da Huw Davies        2016-06-27  1174  		if (entry == NULL) {
ceba1832b1b2da Huw Davies        2016-06-27  1175  			ret_val = -ENOENT;
ceba1832b1b2da Huw Davies        2016-06-27  1176  			goto conn_setattr_return;
ceba1832b1b2da Huw Davies        2016-06-27  1177  		}
ceba1832b1b2da Huw Davies        2016-06-27  1178  		switch (entry->type) {
ceba1832b1b2da Huw Davies        2016-06-27  1179  		case NETLBL_NLTYPE_CALIPSO:
ceba1832b1b2da Huw Davies        2016-06-27  1180  			ret_val = calipso_sock_setattr(sk,
ceba1832b1b2da Huw Davies        2016-06-27  1181  						       entry->calipso, secattr);
ceba1832b1b2da Huw Davies        2016-06-27  1182  			break;
ceba1832b1b2da Huw Davies        2016-06-27  1183  		case NETLBL_NLTYPE_UNLABELED:
ceba1832b1b2da Huw Davies        2016-06-27  1184  			/* just delete the protocols we support for right now
ceba1832b1b2da Huw Davies        2016-06-27  1185  			 * but we could remove other protocols if needed */
ceba1832b1b2da Huw Davies        2016-06-27  1186  			netlbl_sock_delattr(sk);
014ab19a69c325 Paul Moore        2008-10-10  1187  			ret_val = 0;
014ab19a69c325 Paul Moore        2008-10-10  1188  			break;
ceba1832b1b2da Huw Davies        2016-06-27  1189  		default:
ceba1832b1b2da Huw Davies        2016-06-27  1190  			ret_val = -ENOENT;
ceba1832b1b2da Huw Davies        2016-06-27  1191  		}
ceba1832b1b2da Huw Davies        2016-06-27  1192  		break;
014ab19a69c325 Paul Moore        2008-10-10  1193  #endif /* IPv6 */
014ab19a69c325 Paul Moore        2008-10-10  1194  	default:
389fb800ac8be2 Paul Moore        2009-03-27  1195  		ret_val = -EPROTONOSUPPORT;
014ab19a69c325 Paul Moore        2008-10-10  1196  	}
014ab19a69c325 Paul Moore        2008-10-10  1197  
014ab19a69c325 Paul Moore        2008-10-10  1198  conn_setattr_return:
014ab19a69c325 Paul Moore        2008-10-10  1199  	rcu_read_unlock();
014ab19a69c325 Paul Moore        2008-10-10 @1200  	return ret_val;
014ab19a69c325 Paul Moore        2008-10-10  1201  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

