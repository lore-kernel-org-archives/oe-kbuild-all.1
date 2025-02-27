Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB56127003D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666199; cv=none; b=q/0uGRAU51nmmYEGddrxdpOh/WNPRQ03EkdtdsSoHCBUPnYJ2rheTPKtjkm0v4+e4SCJHTyO6QYu2LaTBQJODtTerDsgUxdbQofxHwZIn7GYg2oCBslcAs2xPAGQ2iMF44Uex26/WsDVVwP2odeDP1AXKGtCX/2ua4n9mQoWJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666199; c=relaxed/simple;
	bh=anZg3Yuere6hsPT2KpIgR69wncRg12py2Kyn2hsJAg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAS5chxkHW/F/QCKjyIeaNRY3ClDKY8sHdS47CeSEXm3yNwIV66LXy/8JAsyAe/4DCDjwrdWOvwkPOeFm+jWRqGPhThD5e1hSGTWwnCVxK7ILZNBlIhJW4Ai1MhRZADNQ8Lbs6g/QwxeWOqnDRvaGE3oYPOMxChskAEuMhtzfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3pAZW9S; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3pAZW9S"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abec8c122e4so149732166b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740666194; x=1741270994; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbaW9nOcqUIy8DAvgrKnn7FzoZ7FC9CoGBlSZiwKRHQ=;
        b=k3pAZW9S0PXD04fKPs6agJo0HwEa8S7gbaF/1hbdJeMR+xf+MYb8w+A/AVUOjK70V8
         5i377/Y3xrdMPaujVzbhkZLcoTxaYzifb/1JdiBAZHIjFjKyP/irZEAz8waiFDotrHj2
         bNgpHLEhT67HWPMlHOpQWgJv6skaE5nAWLWuW9XXlsKrn14jiQL2RWHJcDCMvYyPBdQv
         gtlkH3yTPEEtzLOh9PmHV+Lzo+hHdLkJHRvBfCiGAJzihBfX1C0nc8HCtOJQJqg/UzwR
         eFjvlpzhm3cvz570ExWEap1wTy8t0YVCEsueWvDLJE1Z5BJRzMZz1zuJkDGyWwYs+kBn
         ij+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666194; x=1741270994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbaW9nOcqUIy8DAvgrKnn7FzoZ7FC9CoGBlSZiwKRHQ=;
        b=pobmxG3LMrNDzadpYwZQmrMpFqayj3OWB3OXBg/qem+u7N3wpn7QIJXeMHFp245K/5
         RhhyfzDtq6PdOIDMR3s9tKPDmJluiIalSBCm2HJzq3+3apzGKr7apfdzMSXypO4UU6ro
         //wyq0tnaK3Qd9InvZa7XTYZgw9wImvwODbW4GiyL6v3CEG02mjhH+dLCj3eyeEmk3aQ
         uaqhwzzcP8YQzVCFqneY1oOY4jpOMGwmzU6fD75558ncYK5jxD78FPf6IyBxzZHnEh6y
         MWl9kmEaOJ/HnzBUNUSUAaUc92wiyT2DvHIIgnsyVfjzgLqrnrZ42UAwm8H9MJ6m+mhI
         4eRQ==
X-Gm-Message-State: AOJu0YxbTnBm5iMXzeB1sztkyIK4yJCT+68Y8wu4zLpHnV5NkWmh+xHX
	DeBDFsKWs2n6czI0aWGJOHNuUxoc1vFKbWoijKmI1OsFCa1af6vTdifsqA==
X-Gm-Gg: ASbGnctOxKRrCa9KTPvLHdm9QfsOH6/SRPGSZJ42NfJfsRXVeBpHcz+FR1/WR8Q72Ut
	svtZJLxPMyaF9vmnLENUMQ8lcHlzpvXehhrwT41VjQ+iIUHtUrCi1fwxDAj42SJyK3rw4LEDktT
	6sCvMXfmqvL/Siwvw4lHMt0SYGVH3OoK/JlqhoOxMAtvbXYHBh1zezGZ9XXoJ/0WeaxuRDt/3Gm
	m9UAcnld0nogKnEk9YNDDQdseyTzGpWIPEmGt2tVDfTj6JBFS69tzr/MIc8a+qneQaV9IwwimMX
	2Qf0/BQKmDOCJ4X562XG3VKK/pIV338e/nS0WOUn0NpdyGre2jkE1hg6VP8=
X-Google-Smtp-Source: AGHT+IE+7y5+t9Q/GNCtRe/3zeNUR8WLZQvpC6aT568z7tLzcQS7Wi1s0/ZFTK2EOgJznPsL8NunkA==
X-Received: by 2002:a17:907:760c:b0:abf:1e70:f408 with SMTP id a640c23a62f3a-abf1e70f4f3mr120373166b.5.1740666193222;
        Thu, 27 Feb 2025 06:23:13 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:4215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ed7f1sm128738766b.120.2025.02.27.06.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:23:12 -0800 (PST)
Message-ID: <93f80c4d-960c-41d0-8fec-87b3b5b53bb0@gmail.com>
Date: Thu, 27 Feb 2025 14:24:10 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6649/6931] io_uring/net.c:228
 io_compat_msg_copy_hdr() warn: unsigned 'tmp_iov.iov_len' is never less than
 zero.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
References: <202502272105.kjTlPxVq-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202502272105.kjTlPxVq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 14:00, kernel test robot wrote:
...
>     216		uiov = compat_ptr(msg->msg_iov);
>     217		if (req->flags & REQ_F_BUFFER_SELECT) {
>     218			if (msg->msg_iovlen == 0) {
>     219				sr->len = iov->iov_len = 0;
>     220				iov->iov_base = NULL;
>     221			} else if (msg->msg_iovlen > 1) {
>     222				return -EINVAL;
>     223			} else {
>     224				struct compat_iovec tmp_iov;
>     225	
>     226				if (copy_from_user(&tmp_iov, uiov, sizeof(tmp_iov)))
>     227					return -EFAULT;
>   > 228				if (tmp_iov.iov_len < 0)

This one we can just kill, !COMPAT path doesn't do it,
import_ubuf takes care of sanitisation.

>     229					return -EINVAL;
>     230				sr->len = tmp_iov.iov_len;
>     231			}
>     232	
>     233			return 0;
>     234		}
>     235	
>     236		ret = __import_iovec(ddir, (struct iovec __user *)uiov, msg->msg_iovlen,
>     237					nr_segs, &iov, &iomsg->msg.msg_iter, true);
>     238		if (unlikely(ret < 0))
>     239			return ret;
>     240	
>     241		io_net_vec_assign(req, iomsg, iov);
>     242		return 0;
>     243	}
>     244	#endif
>     245	
> 

-- 
Pavel Begunkov

