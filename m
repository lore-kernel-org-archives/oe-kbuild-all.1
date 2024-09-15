Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFABF1C6F55
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411602; cv=none; b=b2Xtdcb0iS8eliW7VilqJ37fIlYuF34YQnK+YmwcFIziGBtnZRRLWzqvyx9j403dDesN3YEInkMx8mofIN71U65e/UqINPGK1B1hggq/QXxKoqHt8HqQgOptpwZUw1oy6H/WsjRuXqqOZAazz9e7BV6ldTIRE8CpmFjkwdCWoTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411602; c=relaxed/simple;
	bh=uibBjiU0hDKK++6/Zoq5P4/I5pvqLw+vYmVEaV8p+KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYdI8TA4Oxmyz/i4slqDjqwgFr9tkbiup12wjNO525ggxON0cU7AkNnjP1g85XDGAoLLPZ/ntFVsXSEkJmFt7hKKjGUC62sKpCLXrJlyst7nAKCDzXq64uzO/V0TJAq+WQiz3EYO8FPnyHb38qjL+4PyHKQxFhCa5zmAQEUgCzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xj7ILnZ/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xj7ILnZ/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37747c1d928so1587559f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726411599; x=1727016399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/xp2UpHVeQlbWOUIfTdRaSlecN8RAsU40G0ryVVMCY=;
        b=xj7ILnZ/pPqV4tOkhTPwPR+bxokRv1c9Ls8UG+qq4eSsSjsHL5yBwvfuUVQoE+QC6J
         RqtDU0iMEkfzzgWuiyc0gRg91rr33uilVHtN2GKKO+eBAU5v706Zy8cGAcTeErrk2egS
         29lKyFOrbSEQOcJce0HP+xcN6EmjefaKGllOTr0DawSNUSt6NZ4Tpju3lkAu0oTj+rO0
         NRLzoUtvHVUqQ27pHxStv0x1z5QLgXLoO+WiFkb4lQMkbZSLVZOHox5n7uCtBwy/PCHk
         G4ukDLaXtzL/nlL8WDxedWbuppzPOF6h5Cv4S+reTJzVSz5nUzacMFy4WIo/Ne1WHkk5
         CBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411599; x=1727016399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/xp2UpHVeQlbWOUIfTdRaSlecN8RAsU40G0ryVVMCY=;
        b=qFVwT6mOUsriWJ1v7VlnWvgDpbJhVKSOIfaEz0L95dzPM/SraDwWyPuN86NcTAkCuX
         v9+0ZjQbVB68DQUkXxLk6BMP+bq7oCsJxVigUc2Zlz+pOuK+CRHEdGel89aZ3FN/4gxn
         2dc/lw4V0G2EaS92d09c74uY2k/hzKM1QpbJb/+YaHeIciBjB4nEOXLwzt9KYyd3hQI/
         ZQQk2Ar2BZfvVBB0NUDD3bKoCnG85QeA44z9oqGH2G+P0/RRnow1TFFetLOkS+wgFT44
         wWQeOX23ArUoH5W2RGq/yXUKWFSxhTertO7KgAUjBAp7HE/F7hu9oMl3qpyqPRxPzDqT
         P3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVDsASMOKVaCT8T2Y4t0jvvkaYqcGCpcPbSyPTRmg11CzLRXi9STN4uM1wuAZ8naMQgwZPg7bDNNiYmY1C5@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkoeq/xQ4OdN8h8iSMRBci4Rz5t9tGmZLd7elxas0qixBOEFNz
	KR0PANrS79ixodLzUQxLigwMD1nxqKzuJ/O+a7F0CAQp3/J+0rkI6jVIvXM0rsg=
X-Google-Smtp-Source: AGHT+IFgxoyXztYvD6Tk0i9//e9XSuu6cTfT5Or50OUFS5dbb8fgykN4+3B0jp947uTyjRLL7ij8wQ==
X-Received: by 2002:adf:ce0f:0:b0:374:bb32:656c with SMTP id ffacd0b85a97d-378d6241fe1mr5287267f8f.39.1726411598880;
        Sun, 15 Sep 2024 07:46:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22e6540sm50876015e9.21.2024.09.15.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 07:46:38 -0700 (PDT)
Date: Sun, 15 Sep 2024 17:46:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [remoteproc:rpmsg-next 4/4]
 drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error:
 strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
Message-ID: <ca187325-4b8e-48fd-8d8a-97d992170693@stanley.mountain>
References: <f2cbe310-64e0-4ee9-98ae-b46d8a2c9340@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2cbe310-64e0-4ee9-98ae-b46d8a2c9340@stanley.mountain>

On Sun, Sep 15, 2024 at 05:40:51PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
> head:   c1ddb29709e675ea2a406e3114dbf5c8c705dd59
> commit: c1ddb29709e675ea2a406e3114dbf5c8c705dd59 [4/4] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings
> config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409152202.xXbeT6sp-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409152202.xXbeT6sp-lkp@intel.com/
> 
> smatch warnings:
> drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
> 
> vim +504 drivers/rpmsg/qcom_glink_native.c
> 
> 835764ddd9af0d Bjorn Andersson       2017-08-24  480  static int qcom_glink_send_open_req(struct qcom_glink *glink,
> 835764ddd9af0d Bjorn Andersson       2017-08-24  481  				    struct glink_channel *channel)
> 835764ddd9af0d Bjorn Andersson       2017-08-24  482  {
> c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  483  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
> 835764ddd9af0d Bjorn Andersson       2017-08-24  484  	int name_len = strlen(channel->name) + 1;
> 
> How do we know that channel->name is NUL terminated?  I believe it comes from
> qcom_glink_rx_defer() where we call:
> 
> 	qcom_glink_rx_peek(glink, &dcmd->msg, 0, sizeof(dcmd->msg) + extra);

->peek is either glink_rpm_rx_peek() or glink_smem_rx_peek().

regards,
dan carpenter

