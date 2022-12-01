Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262B2F5F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Dec 2022 13:43:01 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e13so2392004edj.7
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Dec 2022 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpUjy9heYGgqmbNH8u6SGmVnuBWcmavvEoOJwN1rxws=;
        b=AGplO9r18j6sZNQlC0z4bthtMSEwxWq/0kzFHRP3PyXdgu7LMQREEBaD4TgBtEWgv5
         R4A1M+7WGow9aLZzjV7czxaT7BZ0XWMqh5SVgApEobp8tq2WpPgZpg8jqprll4KmS+Vz
         2vUVmmBtuIUNxjizaxSzDIqEtPdoJfs/pp8obhAZeotD8yBkH0aultZM0M+tzAtk+EQX
         r/ywdi3/kLZEoV02NJTXTF+2bj0UbW9HgUI+oqFT+bKhtyfWmRxrB6BQ9dfSHPauOw9j
         nlQWsDpaye9oJfrCpadx4qbS2iEkO0G7MGz/MfB77Qiv3MmJXwuclpJs0vqXP4ZJmMQY
         eswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpUjy9heYGgqmbNH8u6SGmVnuBWcmavvEoOJwN1rxws=;
        b=4rfM7D7+4yM6VfDOGSEyDrsKQdjaYzfnTOez/4LDysIcXnyZ72veDn3IMVRH6/q9vV
         29CgvCz97pzCV5DvQzV1vgImYUrKCt2GeH3cu8ut1bz/ggIFM9sASHdiPun0WE7AkEND
         mcXLNPp1FbhtoWCahiBhQpxYQsu+0aN6iW4UY60kXX4J3AVdCr675g9vCy1NcfgnH89k
         HMtiJyjlW3JZj/vtE27xpv+POGTnF+Rw1fRwMbb32cWSbu+ltCcK/O8oQt/ySIOXmVgg
         0hMjHiMGK0w2s9wJYV6Bet/zt0DZqh7EmnXrTdka85xs3JLGdphKOxPZ+AT+xW2Nhr0l
         +cIw==
X-Gm-Message-State: ANoB5plhusn2YfcMo1h5xL3AxNjqfictR7j0cZV1fG4vYhPQwweDpMe0
	RATBrVg8LSH7oLVwiurLXHY=
X-Google-Smtp-Source: AA0mqf4QEz32qOlZQMQZlsV4n3cpjYxxUpcytlrBl2nGnD3xJhmYd7YcdH6T93c0LGrAvee7KT6NJw==
X-Received: by 2002:aa7:d3cb:0:b0:461:8d98:3d6d with SMTP id o11-20020aa7d3cb000000b004618d983d6dmr46049856edr.116.1669902180118;
        Thu, 01 Dec 2022 05:43:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090653c700b007c0aa8eaf47sm1058173ejo.116.2022.12.01.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:42:59 -0800 (PST)
Date: Thu, 1 Dec 2022 16:42:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [linux-stable-rc:linux-4.19.y 2019/4527]
 include/linux/sunrpc/xdr.h:512:17: error: comparison is always false due to
 limited range of data type
Message-ID: <Y4ivWyt/rm5YGz0M@kadam>
References: <202212012148.thFgQ6RF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212012148.thFgQ6RF-lkp@intel.com>

>    510		if (unlikely(xdr_stream_decode_u32(xdr, &len) < 0))
>    511			return -EBADMSG;
>  > 512		if (len > SIZE_MAX / sizeof(*p))
>    513			return -EBADMSG;
>    514		p = xdr_inline_decode(xdr, len * sizeof(*p));

This is GCC so we can't just ignore the false positive can we...  Sucks.
I silenced these false positives in Smatch so it's probably not
impossible to fix GCC to know that the long can either be 4 bytes or 8
bytes.

I guess we have to wrap this in a #ifndef CONFIG_64BIT?

regards,
dan carpenter

