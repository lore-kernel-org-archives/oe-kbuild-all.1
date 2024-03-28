Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5588442AA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711654488; cv=none; b=p/3r1M11MNNlsSsEbarkTUKX9Ckaav89G80tSHEnSqvvwD08asDn/voQAhXQGnf60r9GlsJVpwvW7mrpzBjoXr8nI0dXOgAPYFvakdSy88PDzPj6ikzY4ihfG99PdmlL/la0jxcEF+CT2UovxS2osGI86c6l8udpYTb9faNYCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711654488; c=relaxed/simple;
	bh=DZ9SzEdhvGkr/KOY7nAR7mdhSGEQtyoTPcpY7EjDqOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzwPFXO3gj7nmRcQNsW1/40NeoJfeG8Xdpio8TvZn180qkx8/T2lhNozYLunhBOhqD5cGIdSYvHYo/4IEVfLvTWHKEKsFsnxSOC/YmKkNAoCCHJui+puy6Fmbo//ba66pzS+CwL7yubSZTLPWZ08oWPlnli1NfrIVWlDK4vDoFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iF+69Muq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iF+69Muq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso45339a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711654484; x=1712259284; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPJjq9PiKPbe2cpCw0MVXxr0lIBlyImr1gSJFz2pgtY=;
        b=iF+69MuqiYtpuYc0udSBoNvUk6kBqu3vOaFLmFVA0S+LlKG7Uip1U0zBRq3iq9/qhI
         g7oLSdPJG2W5g184HWw8cdjsgOa3uiNuErynTdkQtcDoh3Q2+AgPetjiK39BqpiLJZKw
         f8L8/9D27ka42LcNg+YA5Nrs8BBfFVfzoxbsBEsKB4vUBVgbkIXmeXam2yJKJO2bk/eo
         Sm1cwLGszbXeI/7azB7WBJtlpHWynVje2koHdT4ahuo6JkhFnn62V7wyqfNiX8gw9UXM
         pMg9Z4Ng0dgL0xms9oEbH1Kf4tUFtAN6f1JWBIn3mM1qNGLKbVkBhPArauYktUTpVLM6
         ksWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654484; x=1712259284;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPJjq9PiKPbe2cpCw0MVXxr0lIBlyImr1gSJFz2pgtY=;
        b=X+4/SnpQoT97x8EpQhPhqqWB1pxp0GfnbsMDUuabVZzD2NP8DEYu9LH2BI8uBilcTD
         1q9lmrhdO/HJMrrf7qvBXa4z6HUVWPyOMlhiKaPwl/hA5wIO6wUdAA+PZERXPspVbQE5
         YXrLx5xwYmvbrmgifeVSerOqgXDIFTn5Rmk9Vz6r16lJFZmXKEG5DAtyrNCHtDKCUxk4
         zkxdC/ow/bGCgQ3UxQRSmqb6JbuSOUaBfRtyNNYY8jpPP9xddpAwETfoHbY7a512Tz3V
         Wp9V+sZeDf2baJbl7qF4aazb1P4Qw32bXcPyWEhno6LDunuBFP5VX44EXxb1eQ73l4Wv
         izQw==
X-Forwarded-Encrypted: i=1; AJvYcCVzAf+ywv+chfTzs30xGZVeIrDi8tWVFdXYxSmW8yxtTrzvV+NCbr72SIuOgrra4pFvuhTWfmQRTeLDYU4YzJHLSHNuVPAFVUIa478k0Q==
X-Gm-Message-State: AOJu0YxhSfj3dzsKCHKyny+K4ycHq50Ige0d42TzFujz1q2KU7JswmGr
	AO3BR+12CTZmq45oDUnXIF7m0JlANU0UQ298oyUdPmUyoFjzqP1o/9MqzV8s+uc=
X-Google-Smtp-Source: AGHT+IHsr6KplyNIewbI3DucCRUqH+KpKGEBlQsYqUmj0yt0ivEdGPzOT3ngE3ZBkazEBN6ZCnNqWA==
X-Received: by 2002:a17:907:111b:b0:a4e:2b64:5a82 with SMTP id qu27-20020a170907111b00b00a4e2b645a82mr141228ejb.24.1711654484404;
        Thu, 28 Mar 2024 12:34:44 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hd18-20020a170907969200b00a4750a4a1f7sm1073478ejc.6.2024.03.28.12.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:34:43 -0700 (PDT)
Date: Thu, 28 Mar 2024 22:34:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 23/26] fs/netfs/write_issue.c:567
 netfs_begin_writethrough() error: 'wreq' dereferencing possible ERR_PTR()
Message-ID: <b1479c24-86b8-426e-95fa-8844cc383442@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   56d9c02d8386e1fbfc521da523af44cf48dd97f7
commit: 4426913c4e18c06cfcdb92418a89a936d72dfc09 [23/26] netfs: Cut over to using new writeback code
config: x86_64-randconfig-r081-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290209.izqDvT86-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403290209.izqDvT86-lkp@intel.com/

smatch warnings:
fs/netfs/write_issue.c:567 netfs_begin_writethrough() error: 'wreq' dereferencing possible ERR_PTR()

vim +/wreq +567 fs/netfs/write_issue.c

4426913c4e18c0 David Howells 2024-03-08  555  struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len)
c272eda1e8b823 David Howells 2024-03-18  556  {
c272eda1e8b823 David Howells 2024-03-18  557  	struct netfs_io_request *wreq = NULL;
c272eda1e8b823 David Howells 2024-03-18  558  	struct netfs_inode *ictx = netfs_inode(file_inode(iocb->ki_filp));
c272eda1e8b823 David Howells 2024-03-18  559  
c272eda1e8b823 David Howells 2024-03-18  560  	mutex_lock(&ictx->wb_lock);
c272eda1e8b823 David Howells 2024-03-18  561  
c272eda1e8b823 David Howells 2024-03-18  562  	wreq = netfs_create_write_req(iocb->ki_filp->f_mapping, iocb->ki_filp,
c272eda1e8b823 David Howells 2024-03-18  563  				      iocb->ki_pos, NETFS_WRITETHROUGH);
c272eda1e8b823 David Howells 2024-03-18  564  	if (IS_ERR(wreq))
c272eda1e8b823 David Howells 2024-03-18  565  		mutex_unlock(&ictx->wb_lock);

No return statement

c272eda1e8b823 David Howells 2024-03-18  566  
c272eda1e8b823 David Howells 2024-03-18 @567  	wreq->io_streams[0].avail = true;
                                                ^^^^^^
Warning

c272eda1e8b823 David Howells 2024-03-18  568  	trace_netfs_write(wreq, netfs_write_trace_writethrough);
c272eda1e8b823 David Howells 2024-03-18  569  	return wreq;
c272eda1e8b823 David Howells 2024-03-18  570  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

