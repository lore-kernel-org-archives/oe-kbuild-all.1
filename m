Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048354673
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 02:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738981132; cv=none; b=ffmhNBYI05mW9PmWiJ9l9e0i9rMQX0pwcHqoK7W9iQFkFf+6xuViJ/EwBMrfWRFtyTQ4m50Q1KEciBk42LvAcrDx3aJ78ntZja2xuOHRRedn2Qdv8KO4RfEwyfidpSKLNoX5GMwB7p1qemOmB8Xqt3L52sZwJyV8UMh/sLXyuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738981132; c=relaxed/simple;
	bh=9nvDh+G5Dgqc5oE3152DaXeBYJ3LczX3hO8S0OatEy8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S0fB8w6ai+/ZMEJTdkRgRFkyMdiiId/EvyW2DdOOCDYNUcxo8+qF6DxYm3bmzAqHhOGNXrTekdApSX8mEAbSmZAcTvRYyXneGTgWabwjxRUkj7VJxuAET2c4c6y/fgdaLxwLkNqmLBK3XpQjnstKJ0tdg0c36kM8WX2X2sk9I0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFu80VxI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFu80VxI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso17772485e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Feb 2025 18:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738981129; x=1739585929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nvDh+G5Dgqc5oE3152DaXeBYJ3LczX3hO8S0OatEy8=;
        b=cFu80VxINOwRTgKYGFL5Lq6ToLuOJ8iUR895gRoSqMaNaI9Rdt3IlAz+Ls0s8Q/9s9
         NoCcsIpIxz9UgrTojE1JHW/5KXI7uhNYHAV49mNYFOCkxq3LJqEkQy/1keUNIKXImkfD
         7dq9SZYNNvRNOb/V/6PzGRo6IldQHpg8k9r6YKN3ZGpCHBZo+PrUrAAECeG7InvQikIJ
         RNKEFNZLqTpkwHLcpaw0rQ24eqyAQaZ3Wv0LI3sr2YSuil/2y1xL22YyknXHf5dlxWgc
         RYXJrAMH81Wms9DC0wjKLQBX0+0UJ3gnbR2SLeRa48Qs838KWqKgdvpT5Eccn9HTC2Ju
         YtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738981129; x=1739585929;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nvDh+G5Dgqc5oE3152DaXeBYJ3LczX3hO8S0OatEy8=;
        b=jhmvtLdSHhHC4XON+LtzvicYwhNCk1/am/93zPvLI8QzSw0izbZEE1y/lBqdPTOqZC
         kZfToJ3UsB0Nh3tAZ5bsmfQCW77Q9mpU1hULx6f4xpBRMUQJKCg7fO9erAZrLIFNVfCg
         YeVcfXTEV8NZTZTe5dLCL8lsKXZ+mi9FhGx1pneRxFfxmNkjFhkd9FK3ajg3ahSorb/v
         Kr3Boea+yDhqmxvPqzLdmsG40R5D/du/uO0r26IBK9GGpT+8M4ssN4G3MFp48xmVUS0L
         nof0G57/rpMscQOpnIDM9Fy7hMrpJBP60OMISYj+qt7CenwxMp1/960EnM9kEnbyFpNU
         2QNA==
X-Gm-Message-State: AOJu0YwxgNvloFpxdKap3GyNh+gHxGk3A1eIWi4wn+sZpBldRyQJ+6vX
	ygDpwau/PTGEqQC7u4uB/9UtUBnY+Qd+4C6fe7mH/s4KxGh91Vmx
X-Gm-Gg: ASbGncucMYBXXYNh86qqLqzkF+YHMvzmowgHe+JThvvNL6xrXRSX4evKu/z1N0+0MmT
	wn3hODGd158I1boo6nEqxgcVzb3aQe4Mnn5aUIMLjUxjPMglLq4Fx5JMYf9bjCf1xoVUxnxOMwD
	QjwDijUXUasIGc6JRhO0nSpJH1bmogmZnFZhNHtQ6X+gRCKXyBb5+YmuxIklxcI3aEw9bJirZn7
	/yMd9zDQ5CSX/LBhbd7FmJy6CvOkij5CliSAXlPtleeVHjZTMl//gIch8alTwezv+q0eYS7wQww
	PeVwNArmCzrNh2feeXFcu+ObJPuDNs2PEsCeLe3P0L4fI2/vsvO+TdTupnRSc4lYUo91C9ngZAL
	i6MY=
X-Google-Smtp-Source: AGHT+IEGg8nBpbGY6sZ26Mfm0vA4MJ+3Xa3y31rQrUihjrjn3tJTV+yiYIOw6PikN3A4s/06NDYM5A==
X-Received: by 2002:a05:600c:3485:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-43924994529mr43628425e9.17.1738981129003;
        Fri, 07 Feb 2025 18:18:49 -0800 (PST)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd5e3cddasm19932f8f.22.2025.02.07.18.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 18:18:48 -0800 (PST)
Subject: Re: [PATCH net-next 2/4] sfc: extend NVRAM MCDI handlers
To: kernel test robot <lkp@intel.com>, edward.cree@amd.com,
 linux-net-drivers@amd.com, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 andrew+netdev@lunn.ch
Cc: oe-kbuild-all@lists.linux.dev, habetsm.xilinx@gmail.com,
 jiri@resnulli.us, netdev@vger.kernel.org
References: <6ad7f4af17c2566ddc53fd247a0d0a790eff02ae.1738881614.git.ecree.xilinx@gmail.com>
 <202502080054.s619TTmK-lkp@intel.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <8233a271-5f16-30da-708f-0ca2746d74ac@gmail.com>
Date: Sat, 8 Feb 2025 02:18:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202502080054.s619TTmK-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/02/2025 16:50, kernel test robot wrote:
>>> drivers/net/ethernet/sfc/mcdi.c:2195:12: warning: 'efx_mcdi_nvram_read' defined but not used [-Wunused-function]

Looks like the caller of this fn is only built #ifdef CONFIG_SFC_MTD,
 so this fn should be under the same guard.
Will fix in v2.
