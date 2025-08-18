Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0AC273D84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 06:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498027; cv=none; b=YaxeGAinK4Ci997Mb5JX5XfgzOm/4e+7Brsc0CTHryTYDtouK1+ZcTdGvDyWNdAPKql1WZmxKqrN3LvgyFznuIV4ZeQcxOrp0JjlascB3vJcPc+eM/sOKVRZe/C1cLqNLqfDM877Y3YPiBfAyjsjXMdS77mEsmmMewyrZS4fMHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498027; c=relaxed/simple;
	bh=T3q+O+jof6fhFKBiJ6CVFzCkkLe74GTWxIh8QQz46AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RqT4SM1M60AKHibyL1fdER5kCM66Jdd8uV53jmop+uh/0lNS37efInujuQORURTPHe8RVtFDRIX6a/cxP0AuAtiBNgg58ElLUxygGIcWgUK0ZdMZxjlyoKtO16+mxcG0mNirl0rfnHJ8fW7sAApHJG3H0S3lXOYxsTa+TsaEHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DH/iZurB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DH/iZurB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so2977586f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Aug 2025 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755498024; x=1756102824; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vv+EedLDos6KkXvRZMzob7Rp+3yduDfdutqU9xZjFI0=;
        b=DH/iZurBCHR0MfbjjrXuqJT1QzvLdB7EB5prp/O2TwjYhc7bcg6MEAs0KnDE5Ayz4P
         /Ye0EmhC9uKvWYBUFVgDrOEhxAmt4DgrU9iSx4Imc2ytAm2shPABqRvEIYNsCSDPkGLu
         le0JqlB6xcB2u/pGL9Q1BVp4t/Lnyl9lSDqo/31VfXC4Kx6RrevpqGxi8iyTDPAwh5DT
         hIur3cGo3gqemIw45BdPBDxMVakOK8e2+ARIgFUoO9n/28r6e4xGnKRZ4psJCPUoUrqi
         hVoHcFzzBXHauOshX1krVXvEFD8PsHw3kgk6v+xA2lJWxJNIRM9DQd9xSbw5iwoU1QpR
         WOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755498024; x=1756102824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vv+EedLDos6KkXvRZMzob7Rp+3yduDfdutqU9xZjFI0=;
        b=VJz7QMbL9rY5XHrm78227Kw8nvEuRjw2hwH0Nd3p1JbPlU0OcLreX3Z3WRUGvQrYIO
         +nPBiTZc4IvGO+OmMFhE6jeyAzeM+RzRk33OzYB4ow6o0nOiatqMxKGQHOJzjvQX1VDO
         ngZxGsWk3rGyXOuzpWDk7vPYIqkBaWI/tG/q6KWA7s9gyi8CAX4G7e9I4Iym+3S837Dy
         0r9Ys9b846ofix7Oxb6lPSoNmfpLAR9iTow0Df1QSSOQJnA33FXgpHe+d+eDjVaZHK7L
         wTmRzo1NcauPexZsBqQ5rS2P5CsNJpzxp3OBtIQO/wN9/XbU0mME/Q+mJLxXzRwYoVw7
         0LKA==
X-Forwarded-Encrypted: i=1; AJvYcCVdEA9qz1pzWGmeOob9658oMcGyQdD0ie9TGEXkVZZvpUpcqQ46Pp1I/0Wt9/vr5x3zXe7LUJF0cc+Xblvz@lists.linux.dev
X-Gm-Message-State: AOJu0YxlzREg2+bS+aTknUbYi6qwtfz3l6MR23EnkJ7LbyjACYZBLv9M
	ZJJ/DgXX0yM6kwHIK0p8295bO/Kr12ppaEowEnpwv9rKkh1d9QgnMt84Voh7c2RetO8=
X-Gm-Gg: ASbGncvXQTQpRM1l5R1VdTFLHwIbPl5qmsolNeNiddbve448T8As3EsmOQYmgXGd5x7
	s7KamdLepM2IhdROLZnpr5ZQpORqhMP76ARk1EohJMrZTAZkRFoWCzQJ88XNbHIFAx2AAM2PMDq
	YhJffQnQ/oS4VBSXl2vJAzm1mwQzAtbuRSf+mbpw9ONGQj+wkY7qJ85TEOUQtg7AbSVhpCyT0WJ
	zRh/TXaTv8NF1M+SK37Lqu7sMFmjXac1aqbCJUAZWwGMpbxKBZR0ThxggOp/CPUvkuwPwcyoI6z
	Wb8yon0WzvX1xFuM07mvTKeDC9iEjUxKKBG//bYmrJo/O79yjQGGZVQ5arA9IBlbwPyhlnxVy+J
	M6wXcmxupy/ti6qQT914Bd/ni13I=
X-Google-Smtp-Source: AGHT+IG+5SFi/GAbP4l+i/xmyijRNIVvSEjZ/3P/W3aR8A+Chf11iBLXkTTgzrgOP4ZfTjF9okFrnw==
X-Received: by 2002:a05:6000:2284:b0:3b9:1635:c13 with SMTP id ffacd0b85a97d-3bc684d7af0mr5411496f8f.16.1755498024235;
        Sun, 17 Aug 2025 23:20:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb676caf79sm11538282f8f.42.2025.08.17.23.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:20:23 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:20:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Xing <kerneljasonxing@gmail.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, bjorn@kernel.org, magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com,
	sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net,
	hawk@kernel.org, john.fastabend@gmail.com, horms@kernel.org,
	andrew+netdev@lunn.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	netdev@vger.kernel.org, Jason Xing <kernelxing@tencent.com>
Subject: Re: [PATCH net-next 1/2] xsk: introduce XDP_GENERIC_XMIT_BATCH
 setsockopt
Message-ID: <202508171049.SGYNFbP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811131236.56206-2-kerneljasonxing@gmail.com>

Hi Jason,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/xsk-introduce-XDP_GENERIC_XMIT_BATCH-setsockopt/20250811-211509
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250811131236.56206-2-kerneljasonxing%40gmail.com
patch subject: [PATCH net-next 1/2] xsk: introduce XDP_GENERIC_XMIT_BATCH setsockopt
config: s390-randconfig-r073-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171049.SGYNFbP3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508171049.SGYNFbP3-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:1495 xsk_setsockopt() warn: inconsistent returns '&xs->mutex'.

vim +1495 net/xdp/xsk.c

48248366d9de2a Jason Xing         2025-08-11  1460  	case XDP_GENERIC_XMIT_BATCH:
48248366d9de2a Jason Xing         2025-08-11  1461  	{
48248366d9de2a Jason Xing         2025-08-11  1462  		unsigned int batch, batch_alloc_len;
48248366d9de2a Jason Xing         2025-08-11  1463  		struct sk_buff **new;
48248366d9de2a Jason Xing         2025-08-11  1464  
48248366d9de2a Jason Xing         2025-08-11  1465  		if (optlen != sizeof(batch))
48248366d9de2a Jason Xing         2025-08-11  1466  			return -EINVAL;
48248366d9de2a Jason Xing         2025-08-11  1467  		if (copy_from_sockptr(&batch, optval, sizeof(batch)))
48248366d9de2a Jason Xing         2025-08-11  1468  			return -EFAULT;
48248366d9de2a Jason Xing         2025-08-11  1469  		if (batch > xs->max_tx_budget)
48248366d9de2a Jason Xing         2025-08-11  1470  			return -EACCES;
48248366d9de2a Jason Xing         2025-08-11  1471  
48248366d9de2a Jason Xing         2025-08-11  1472  		mutex_lock(&xs->mutex);
48248366d9de2a Jason Xing         2025-08-11  1473  		if (!batch) {
48248366d9de2a Jason Xing         2025-08-11  1474  			kfree(xs->skb_batch);
48248366d9de2a Jason Xing         2025-08-11  1475  			xs->generic_xmit_batch = 0;
48248366d9de2a Jason Xing         2025-08-11  1476  			goto out;
48248366d9de2a Jason Xing         2025-08-11  1477  		}
48248366d9de2a Jason Xing         2025-08-11  1478  		batch_alloc_len = sizeof(struct sk_buff *) * batch;
48248366d9de2a Jason Xing         2025-08-11  1479  		new = kmalloc(batch_alloc_len, GFP_KERNEL);
48248366d9de2a Jason Xing         2025-08-11  1480  		if (!new)
48248366d9de2a Jason Xing         2025-08-11  1481  			return -ENOMEM;

mutex_unlock(&xs->mutex); before returning

48248366d9de2a Jason Xing         2025-08-11  1482  		if (xs->skb_batch)
48248366d9de2a Jason Xing         2025-08-11  1483  			kfree(xs->skb_batch);
48248366d9de2a Jason Xing         2025-08-11  1484  
48248366d9de2a Jason Xing         2025-08-11  1485  		xs->skb_batch = new;
48248366d9de2a Jason Xing         2025-08-11  1486  		xs->generic_xmit_batch = batch;
48248366d9de2a Jason Xing         2025-08-11  1487  out:
48248366d9de2a Jason Xing         2025-08-11  1488  		mutex_unlock(&xs->mutex);
48248366d9de2a Jason Xing         2025-08-11  1489  		return 0;
48248366d9de2a Jason Xing         2025-08-11  1490  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1491  	default:
c0c77d8fb787cf Björn Töpel        2018-05-02  1492  		break;
c0c77d8fb787cf Björn Töpel        2018-05-02  1493  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1494  
c0c77d8fb787cf Björn Töpel        2018-05-02 @1495  	return -ENOPROTOOPT;
c0c77d8fb787cf Björn Töpel        2018-05-02  1496  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

