Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E02CA6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411261; cv=none; b=qE4HlrFtvzbp6PujallhVHP7ndpi1k5CEcGE2PE+BQNDshlwYAzsqcJgWDj4Y/CFl7QAX0GVzB2r6X5K4E0TYE2reBIZlMyU/0+X+r0useISCukbFhkctg65CXZdZLFXV7J8+TUjp1mul0fNBf3cYp/2yUvslpQhcpF5dZmKvE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411261; c=relaxed/simple;
	bh=cn2zSHul7n9jADjTqG3ykpXtZxIgHfTWwxqtMQvOnm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KW9yhjaM7y4ixfHFcO7Il5Y5x5hpM+9JQPW2PCIxJ54Co41qIOVc62xMU+hWt6NTTI5W2Mtmzzwuld5TpBneqT9RQAw99uVpXcsqHw0B/ndxR7Byx2VghHTUg1M++1Gay/ZQtN0w55XkOXem5/dw8P0xDDK+pj0hUSoq1Ww37d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYRqTMGv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYRqTMGv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso22942025e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726411256; x=1727016056; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uG5/XTk+hkk96rAROtoNEP0h5Qop/dY8C6YNU/YV+4o=;
        b=zYRqTMGvoKQUzpjStGXxNi/swA1JyQ0rQDFwOMMO/XUm8z5MYzIjdLeL6LWBRCk31z
         1HSss+LKWIA8dSuzzz4KjMzNJywbjhyFaVKzVFrkCGqVVlVavdCxoxA/Q1eda8RQp8/b
         Hr42O0+HMGinmW+Q656xlGLdXWpkeoN7D/Iu8K4sO5vRUNxKKEWYNXRbRGl0ZjU0nvYd
         LmB8RX99Bl94D9c7oi3TZMNOsIsSW/qGNETsMpVucQkMKpm3qnvQn8+JX318oWNn4kqq
         NeuzK3va6JyzOKoQ+bdwthVsisilBQpRDGf4cq+3xv7hsIplME0qIWvooASydsK50tBr
         jC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411256; x=1727016056;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uG5/XTk+hkk96rAROtoNEP0h5Qop/dY8C6YNU/YV+4o=;
        b=Dt7QsLH1dxByv5Wl0AZN2vADXtLOO4Bt0G1NddDvFUwJ12rcbvl1N1/2xG0KFL2gus
         vTIjFhUpjvfcK/Tt450p9DR7IQcgp+zdninIj0Ag6UzLzTDwb/Vaq22/XMlQagTWeA2A
         S7j+U0dNal5270tgVSWkSGOnks6uEjeHCFq7Sy2jpv9yhIPC/jYxYMt6wAaa22ia87Qb
         v8M2qT/443ktN46ydFQGCFd2M+jPvwkG7DaaSjsaWButSmt5h8U3gac/4FbfORHANDgk
         4O+xPxTkNpoD7rBeOY7Ny419rTyzgyiMehj6CMvL8c+rMqHdeRlJDxT11aXBEZiJXuZE
         EV5w==
X-Forwarded-Encrypted: i=1; AJvYcCXktx5pJlc2RAU6toDu3zfa7fUYtHh0zDH1cRS4qgW1mr1Tex+n7IAiicRrpuW4U5qyvzkNjfP86aENsJ5b@lists.linux.dev
X-Gm-Message-State: AOJu0YzwEeo0PjlkElrp8PRAoBGIvFQvmIb4zs6V/4M3Ckt05IECWVrM
	Uj963s6hSeug0/sNGkBPQe8FBNrHqAw2EHZW9Fb1dhD2z41U7Gu/Jwt8kD1Vd0o=
X-Google-Smtp-Source: AGHT+IFa7XP4pd6s6i/+zPMTtIfmqmQ23Bhy6XXNEStugY6XWKiepxTjI5x0dlayLMvNzsAgFwWwRA==
X-Received: by 2002:a05:600c:458e:b0:42c:bd5a:9471 with SMTP id 5b1f17b1804b1-42cbde23b7cmr118847365e9.16.1726411255915;
        Sun, 15 Sep 2024 07:40:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e62989024sm2852575e9.36.2024.09.15.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 07:40:55 -0700 (PDT)
Date: Sun, 15 Sep 2024 17:40:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>
Subject: [remoteproc:rpmsg-next 4/4] drivers/rpmsg/qcom_glink_native.c:504
 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for
 'req->data' (1010102 vs 32)
Message-ID: <f2cbe310-64e0-4ee9-98ae-b46d8a2c9340@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   c1ddb29709e675ea2a406e3114dbf5c8c705dd59
commit: c1ddb29709e675ea2a406e3114dbf5c8c705dd59 [4/4] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409152202.xXbeT6sp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409152202.xXbeT6sp-lkp@intel.com/

smatch warnings:
drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)

vim +504 drivers/rpmsg/qcom_glink_native.c

835764ddd9af0d Bjorn Andersson       2017-08-24  480  static int qcom_glink_send_open_req(struct qcom_glink *glink,
835764ddd9af0d Bjorn Andersson       2017-08-24  481  				    struct glink_channel *channel)
835764ddd9af0d Bjorn Andersson       2017-08-24  482  {
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  483  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
835764ddd9af0d Bjorn Andersson       2017-08-24  484  	int name_len = strlen(channel->name) + 1;

How do we know that channel->name is NUL terminated?  I believe it comes from
qcom_glink_rx_defer() where we call:

	qcom_glink_rx_peek(glink, &dcmd->msg, 0, sizeof(dcmd->msg) + extra);

We add it to the &glink->rx_queue and then in qcom_glink_work() we call:

	qcom_glink_rx_open(glink, param1, msg->data);
                                          ^^^^^^^^^
qcom_glink_rx_open() assumes msg->data is NUL terminated.

c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  485  	int req_len = ALIGN(sizeof(*req) + name_len, 8);
835764ddd9af0d Bjorn Andersson       2017-08-24  486  	int ret;
44f6df922a260f Sricharan Ramabadhran 2017-08-24  487  	unsigned long flags;
835764ddd9af0d Bjorn Andersson       2017-08-24  488  
835764ddd9af0d Bjorn Andersson       2017-08-24  489  	kref_get(&channel->refcount);
835764ddd9af0d Bjorn Andersson       2017-08-24  490  
44f6df922a260f Sricharan Ramabadhran 2017-08-24  491  	spin_lock_irqsave(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  492  	ret = idr_alloc_cyclic(&glink->lcids, channel,
835764ddd9af0d Bjorn Andersson       2017-08-24  493  			       RPM_GLINK_CID_MIN, RPM_GLINK_CID_MAX,
44f6df922a260f Sricharan Ramabadhran 2017-08-24  494  			       GFP_ATOMIC);
44f6df922a260f Sricharan Ramabadhran 2017-08-24  495  	spin_unlock_irqrestore(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  496  	if (ret < 0)
835764ddd9af0d Bjorn Andersson       2017-08-24  497  		return ret;
835764ddd9af0d Bjorn Andersson       2017-08-24  498  
835764ddd9af0d Bjorn Andersson       2017-08-24  499  	channel->lcid = ret;
835764ddd9af0d Bjorn Andersson       2017-08-24  500  
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  501  	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  502  	req->param1 = cpu_to_le16(channel->lcid);
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  503  	req->param2 = cpu_to_le32(name_len);
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07 @504  	strcpy(req->data, channel->name);

Use strscpy(req->data, channel->name, GLINK_NAME_SIZE);

835764ddd9af0d Bjorn Andersson       2017-08-24  505  
34f79c11fb2f31 Bjorn Andersson       2024-08-05  506  	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
34f79c11fb2f31 Bjorn Andersson       2024-08-05  507  				     channel->lcid, channel->rcid);
34f79c11fb2f31 Bjorn Andersson       2024-08-05  508  
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  509  	ret = qcom_glink_tx(glink, req, req_len, NULL, 0, true);
835764ddd9af0d Bjorn Andersson       2017-08-24  510  	if (ret)
835764ddd9af0d Bjorn Andersson       2017-08-24  511  		goto remove_idr;
835764ddd9af0d Bjorn Andersson       2017-08-24  512  
835764ddd9af0d Bjorn Andersson       2017-08-24  513  	return 0;
835764ddd9af0d Bjorn Andersson       2017-08-24  514  
835764ddd9af0d Bjorn Andersson       2017-08-24  515  remove_idr:
44f6df922a260f Sricharan Ramabadhran 2017-08-24  516  	spin_lock_irqsave(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  517  	idr_remove(&glink->lcids, channel->lcid);
835764ddd9af0d Bjorn Andersson       2017-08-24  518  	channel->lcid = 0;
44f6df922a260f Sricharan Ramabadhran 2017-08-24  519  	spin_unlock_irqrestore(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  520  
835764ddd9af0d Bjorn Andersson       2017-08-24  521  	return ret;
835764ddd9af0d Bjorn Andersson       2017-08-24  522  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

