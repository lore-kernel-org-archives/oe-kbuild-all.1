Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B61D5AB7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683252; cv=none; b=X+mxj7h8ucvvSYX8YokZV/c61KQfjUWVAdOSBqAItVfJmADriKPfp/sXyU1jNrwhciFgGk3JI+IQYOVprNXLJNFGXeYMbOHQWiP+K91Yz/xE3+wL0pM0SMk90onkKgbk1J+U+ajpzibNUpqC9rYHYb2M8MgrUCzt4YXRnsl9g88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683252; c=relaxed/simple;
	bh=M4+zHfcI33Z2cFnsOe/pEfEdRumAQbSlZAruITsX9Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNfy/oLKeu87jJy0IUAkxV09jlz9ocekzA9To6L3u6r4xrE2xA4DGDiOM042SwlmWMc7BlmNeGQAS+oRyBXlG6tRtLkOrezrcvNfbhH/IF7xRNPKkZV3EvR/xvn/aAMZys0jT0iGhv2QXK6ZrT7OxdOlQipLcfyXI3lgyVwC6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcWoIzzz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcWoIzzz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso2645685e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 22:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746683249; x=1747288049; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5CTBM0j2lcGjU5ouKbWKErsqM/JgWcN5EvB9r2bUWU=;
        b=NcWoIzzzyPcr6ZPx/FHdoJKyANCjDqXhaRPHHyNXTPSuzMQftOv8nJqf9y/x+Lwcgt
         z186Bdn+qIp5Qmdl+GqAkubNynX94p5yaaStCXKTQUUvXmVsCYGMQWifOenABnoNuNo5
         sCraFHIH+5fyIfKWvr6zryLvbOpY5x1A7nMPtfDWLd26MBP+6a/WNqhwXygXc4sSLFW6
         PI7CJ+911c56sK/8OoWYiq0dWD0TxNz76SCuMGyNruntNEim4ByKVrMB8Q0+ZFrsr0aG
         dxvZ9pdDC/D3SrwW2jqlXMe4WM3TffePQi0adUqhBGBeZ4/I5aBruYalQvl3fEuGohbL
         oyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746683249; x=1747288049;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5CTBM0j2lcGjU5ouKbWKErsqM/JgWcN5EvB9r2bUWU=;
        b=vDaGwnIqx00Axm57zy0hqJQKuYCYyjMBZMu3PACcMbxzOJ2EMg4z3vOaqOyTG5A3rX
         dyLWw9Qpvfeg/ZUaPoHzoUX64He1uSNhiP6DEXIq9okC4GDmbwFBRFWc5M4Fyfr6TP51
         qpmj7Onk1jz5arJz6c3w8DfvG40n+CMYdseIllxlhi+zkLy/yuCOXJc48hLUBla9Mtcs
         jWwleZOUq8jML1vtgVXtjgGNuI+3LNPgXReqBNNRtOH/bgZLN+/wSWR2ZJeZReJahEDc
         ynWQUwucbbohefWcajtbTZgb/q0rPmm6U++8ObRNm5g5RyW0zirb+iZNirEeIL3XC1aB
         Fm/A==
X-Forwarded-Encrypted: i=1; AJvYcCXQxkC1DGQqM8bawv1WvKDM50HA7xO9dKpiMxuuwkBcVPDDUX+VZrd+tr1n9KrQqD0mgWdNiZ8xfbjMeBJu@lists.linux.dev
X-Gm-Message-State: AOJu0YwiVfmshfmUBNH9Lzwo61i66k0w9DXmeoCT+PE/32Bt29vs5wbh
	w9jyHPgrUvv3fLPx5XFfiM5XjHBpDc0zAx+at3JnNB9PvEB60DbjzOEZ8vsZcmIBl/QRCYbSU62
	v
X-Gm-Gg: ASbGncvS8pcYK2mooJSxJ9bPnG2zZlwOOrL7eqLuZ7WPhIPO6YIdhday2y+LKn1PmgN
	vPqG4yEah3K0lOVwDnTSVZQcTeYwv7iD1tlgCiy3sUx9MMl7KV3OvGv2fJ5lkeAgekWrhQ7a651
	nYZlmhexm9VcGekiVH4JyHgalUkKOJKFsEHbKZ7zeHwoHhzoyW3I1/G5JISGKWZDi1JtAYv/KIE
	diPxvz+Q4Y26p6G185jVJr/fAmXpLK4s7f4L/ZWKYtthXbwWERZbUoJ4C9FFrxc22DhllhkY1GR
	ulIDRJVaSUDIzRtDE1o5akc1KaFI+xxSzNB2M+bQ72J2Mw==
X-Google-Smtp-Source: AGHT+IFcFCh0MsHBkg+J+VSER1ov0BEAS5iQlZeuPgTMA0LYLNvoc9VAJTqMWqYUfF3nzedFbo4nHw==
X-Received: by 2002:a05:600c:35d3:b0:441:d437:ed19 with SMTP id 5b1f17b1804b1-441d44c4457mr42205415e9.11.1746683248755;
        Wed, 07 May 2025 22:47:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f3c2sm24406215e9.15.2025.05.07.22.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:47:28 -0700 (PDT)
Date: Thu, 8 May 2025 08:47:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/oplock.c:155 opinfo_get_list() warn: can 'opinfo' even
 be NULL?
Message-ID: <202505080231.7OXwq4Te-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   707df3375124b51048233625a7e1c801e8c8a7fd
commit: 18b4fac5ef17f77fed9417d22210ceafd6525fc7 ksmbd: fix use-after-free in smb_break_all_levII_oplock()
config: i386-randconfig-141-20250416 (https://download.01.org/0day-ci/archive/20250508/202505080231.7OXwq4Te-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505080231.7OXwq4Te-lkp@intel.com/

New smatch warnings:
fs/smb/server/oplock.c:155 opinfo_get_list() warn: can 'opinfo' even be NULL?

vim +/opinfo +155 fs/smb/server/oplock.c

e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  145  static struct oplock_info *opinfo_get_list(struct ksmbd_inode *ci)
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  146  {
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  147  	struct oplock_info *opinfo;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  148  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  149  	if (list_empty(&ci->m_op_list))
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  150  		return NULL;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  151  
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  152  	down_read(&ci->m_lock);
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  153  	opinfo = list_first_entry(&ci->m_op_list, struct oplock_info,
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  154  					op_entry);

The list_first_entry() macro never returns NULL.  If the list is
empty then it returns an invalid pointer.  Use
list_first_entry_or_null().  We have the check for list_empty()
at the start of the function but it's outside of the lock so it's
probably not safe to assume it's still true.  (I haven't looked
at the locking here outside of what the kbuild-bot includes in this
email).

36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19 @155  	if (opinfo) {
c8efcc786146a95 fs/smb/server/oplock.c Namjae Jeon 2024-03-12  156  		if (opinfo->conn == NULL ||
c8efcc786146a95 fs/smb/server/oplock.c Namjae Jeon 2024-03-12  157  		    !atomic_inc_not_zero(&opinfo->refcount))
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  158  			opinfo = NULL;
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  159  		else {
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  160  			if (ksmbd_conn_releasing(opinfo->conn)) {
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  161  				atomic_dec(&opinfo->refcount);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  162  				opinfo = NULL;
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  163  			}
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  164  		}
36322523dddb111 fs/smb/server/oplock.c Namjae Jeon 2023-05-19  165  	}
18b4fac5ef17f77 fs/smb/server/oplock.c Namjae Jeon 2025-04-15  166  	up_read(&ci->m_lock);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  167  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  168  	return opinfo;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

