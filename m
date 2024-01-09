Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03993DB92
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SUCQf+ct"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28bf1410e37so3087460a91.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Jan 2024 15:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704841298; x=1705446098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GR/ms3ctfSsOUjIPALp8Jd7xLfAi/c50pWgtGgQX/O4=;
        b=SUCQf+ctqAJsGMJUM68nHr5tIWNca6lvX56J1xo08D0SNKZuyJLEKOJbVNbpMbd+B7
         nXSLulNETzXsbB2r7nbgEo6AmJIp9rKLHWgHflfgRfjZ+Mb9jDSnPeerpCHsQXFuUznz
         awVrttK58M87UL9aDHkt6p2XFGIs9AxVjcAlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704841298; x=1705446098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR/ms3ctfSsOUjIPALp8Jd7xLfAi/c50pWgtGgQX/O4=;
        b=H7wvdtLyKF+cVbFS7WDi0ZExxJKQ9JbD/t4r70urYv9Ogbg6Q3GIh3F/aAjKqm3Tz5
         DqOp9KWnhlhSmjhxWHjcXG4Gbu+HbuionniW2gd12OJ1tEveLzcMViI5XavMQCfCYCcm
         o3yHiecNKuwfM71D0poLm8geexBleUyjQemoGW3OPmrsLKUYclxxQzIKoAx4b+nKuvMq
         047Fy2dhpULabal3ekVq5+EymTBxHOdoFEztIW4fURuFOXujcvLIPa9ZeftXwzmhlhwA
         zly+nCc8C1w/sasCuLcyxsKWq907wmNZx5rpttpX8Zf4Ji/n9+KdwZcW1dkpLVJ45+I4
         LPNA==
X-Gm-Message-State: AOJu0YzEzdJotfF8NZ2nvBjor+iQPcR7ZsLdS+Jrs/E7FGJWBzOuRQkB
	18hnpv4imhLlVupYSf+rFgGwoBIA9Wtu
X-Google-Smtp-Source: AGHT+IEY9Ix5SjUd+2ybDs5lq+IUV5YSx5/dvVEQmA/K0Lydmc2CVqTv4/6oDxz4SjwLcsDqIp7aCQ==
X-Received: by 2002:a17:90b:2397:b0:28c:446c:8093 with SMTP id mr23-20020a17090b239700b0028c446c8093mr40661pjb.26.1704841298243;
        Tue, 09 Jan 2024 15:01:38 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id eu15-20020a17090af94f00b0028b845f2890sm19498pjb.33.2024.01.09.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 15:01:37 -0800 (PST)
Date: Tue, 9 Jan 2024 15:01:37 -0800
From: Kees Cook <keescook@chromium.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: lkp@intel.com, x86@kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, yu-cheng.yu@intel.com
Subject: Re: [PATCH] x86/shstk: Use __force when casting away __user
Message-ID: <202401091501.4EC0C8EAD@keescook>
References: <202401080003.duO4RmjK-lkp@intel.com>
 <20240109224619.1013899-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109224619.1013899-1-rick.p.edgecombe@intel.com>

On Tue, Jan 09, 2024 at 02:46:19PM -0800, Rick Edgecombe wrote:
> In setup_signal_shadow_stack() the kernel needs to push the restorer
> address to the shadow stack. This involves writing the value of the
> restorer pointer to the shadow stack. Since the restorer is defined as a
> __user in struct k_sigaction, the __user needs to be casted away to read
> the value. It is safe to do, because nothing is being dereferenced, and
> the de-__user-ed value is not stashed in an accessible local variable
> where it might accidentally be used for another purpose.
> 
> However, sparse warns about casting away __user. So use __force to
> silence sparse and add a comment to explain why it is ok.
> 
> Fixes: 05e36022c054 ("x86/shstk: Handle signals for shadow stack")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401080003.duO4RmjK-lkp@intel.com/
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Seems fine to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
