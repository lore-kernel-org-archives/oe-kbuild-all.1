Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B11CD213
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376298; cv=none; b=g04QivXJcfo12wLqE7yiRIPe72KoM9GtLLUZiSAr60uba2xIayjEn/+dF48GzmvaQqUPY9mrNkOtyjiFDOrww9K1c2p7dwuz7RwBuxMEHbl5inlLJZY66dKfNbPHjS5eFWRWbH2vxxPoBbL8DzhI3u4dIDDlg7a9aOIz0G+NTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376298; c=relaxed/simple;
	bh=LgcU+yhBh+l9bhiN7Hfb7J+u/TgkVqvrmLWzYxBo0Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ok1mH2KpxJukxyoTX00XWr33oPgfXuHhprcgW66ADoFoXtNpDLYSwFkbJ+GSEQlaPI2u3jbyIthLjbhgIje0uHNdzecl6fJ32x8MJ1eCy+XpmTtqAawsHoatnyTdO8Km/vEX8vYGOIsV+bDN6n4aXyhwvk04z8ejgAXt065JQtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tsvkjtLh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsvkjtLh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43624b2d453so50596675e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 11:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734376295; x=1734981095; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QvW0jkfS25+nFNI+R7Ffi822G44SGFCgigfQrXIBDg=;
        b=tsvkjtLhdaBxhRjd1/degqQC1kKib91TdxhOSbhnq9x70elHJs8JSy3F4XCGtEFpuI
         yj3f3s4hpubplvutuTgHXPfrudipQGw+o/BkFTpTS8lHNol09dxF6RWmlAyMBg+7c6RA
         Pz2ZrK9PjVibfnRAZ8Ey6oB+rmRnN6OtQiZv6u0dUva/Bxlr1NVn9kjvgv0Z6fmGOEMj
         dlUlIn/3HSFK4m1PvOoPFoNdrM2SduPkhxF5DXKyBPhbrUDyBeBtMimo3iYydTRFP8hl
         DznYdhLI30UeGadRkaEa1LJWXaYFP2Vv1f/aDHvR3KZGtkrOg86dlz+7y2QCt8zAjKpg
         AAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734376295; x=1734981095;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QvW0jkfS25+nFNI+R7Ffi822G44SGFCgigfQrXIBDg=;
        b=aSoMYjAuSNs1y3kBy8QkFQhrDG6+uhA+Oy0FdNgGGwcMyH2smxK9IYFtzC3ywgygNY
         lZhejOZh2qZLXZ73eln/1BlJyEIQkINyfxDGAwGqvjvMwhbUIkGz2Wd6jY+kw0p0W8yn
         BfoyQFPLZxky3uYCoPvrkg1vYBghidRSQKb6DZ2JPln1DA2TNxGpLZOjAwDqd9ZiQ957
         ZcJhHXY74QjP9XlsfH/Q1FUtIESwrfFi48xs1fbfSQBSOYAtRDYPFXcannEefdko9VE2
         m2GKS51/s9JDDYXxCTKSMjS/Q+i/oC2Sb83ou8jU+pPziWiPGv1L5Fs+1tUNRf9MDLru
         AozQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQl5LneikiK5/zMQakvhnSeFBlpMkZd9dO3R0GmuFfZBUW0d2RpT0zl+XGLR87S9CDX0GBThNzFsTqvqi8@lists.linux.dev
X-Gm-Message-State: AOJu0YwfphkMipr8dyeSM9Ft1mRasGUU2v38YkRN8GyhUv2qVjgNe+FW
	w+U4Sa9K8Rx73fjIWXicGaDNFZLEbnxnuMLB1PFhtKibOKicPY9myvGsTZnbUxOaWJWoKI9pc9N
	V
X-Gm-Gg: ASbGncsXBlq7F3vErnjfTeF8DVQr5k50dTAZXG/kaVkgazZvDI20e1YFirLy4jlEztn
	URn0+p0cvekZ4IMRCJCLB8SmXGCztuq4ePBOdHDU53P2fwnpm9CUkmppNok4T/YFYlra339Ghvq
	vYTTS5pIa3OtiJWejR+P/sxjmXlzs9gaeWhmy1srjDcsx63GWpryTASfmHtBaCrqDK7orheO70g
	BsSnuNZ5YFr9PwSlfPHOOslGU6YS5WWqRuhlQpH47shVsuSPoZj1S8dVBIzGg==
X-Google-Smtp-Source: AGHT+IEWdLiJi+hIFthpOfwPjqDTJWFjuwayxyhejQvoaoLgBHnoK7ivRp5Q6olDqLBBY2j+5eHMtQ==
X-Received: by 2002:a05:6000:1acf:b0:385:dc88:8214 with SMTP id ffacd0b85a97d-3888e0b876dmr11429157f8f.43.1734376295261;
        Mon, 16 Dec 2024 11:11:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359c8dsm360697466b.130.2024.12.16.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 11:11:34 -0800 (PST)
Date: Mon, 16 Dec 2024 22:11:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3274/4379] kernel/trace/trace.c:3879
 trace_check_vprintf() error: we previously assumed 'buf' could be null (see
 line 3864)
Message-ID: <990caf3a-2f9f-4b77-b87b-f1d509a7c6a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: ff54c8dc3f7ada7f204081d4d1876108eef1e8c0 [3274/4379] tracing: Fix trace output when pointer hash is disabled
config: x86_64-randconfig-161-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170122.KuGhPElA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412170122.KuGhPElA-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:3879 trace_check_vprintf() error: we previously assumed 'buf' could be null (see line 3864)

vim +/buf +3879 kernel/trace/trace.c

ff54c8dc3f7ada7 Steven Rostedt          2024-12-12 @3864  			if (!buf) {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3865  				char *buf = kmalloc(TEMP_BUFSIZ, GFP_KERNEL);

"buf" is re-declared as a shadow variable.

ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3866  				if (!buf) {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3867  					/* Need buffer to read address */
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3868  					trace_seq_printf(&iter->seq, "(0x%px)[UNSAFE-MEMORY]", str);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3869  					p += j + 1;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3870  					goto print;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3871  				}
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3872  			}
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3873  			if (len >= TEMP_BUFSIZ)
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3874  				len = TEMP_BUFSIZ - 1;
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3875) 
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3876) 			/* Try to safely read the string */
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3877) 			if (star) {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3878  				ret = copy_from_kernel_nofault(buf, str, len);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12 @3879  				buf[len] = 0;
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3880) 			} else {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3881  				ret = strncpy_from_kernel_nofault(buf, str, TEMP_BUFSIZ);
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3882) 			}
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3883) 			if (ret < 0)
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3884) 				trace_seq_printf(&iter->seq, "(0x%px)", str);
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3885) 			else
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3886  				trace_seq_printf(&iter->seq, "(0x%px:%s)", str, buf);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3887  			trace_seq_puts(&iter->seq, "[UNSAFE-MEMORY]");
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3888) 		} else {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3889  			save_ch = p[j + 1];
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3890  			p[j + 1] = '\0';
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3891) 			if (star)
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3892  				trace_seq_printf(&iter->seq, p, len, str);
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3893) 			else
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3894  				trace_seq_printf(&iter->seq, p, str);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3895  			p[j + 1] = save_ch;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3896  		}
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3897) 
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3898  		p += j + 1;
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3899) 	}
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3900)  print:
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3901) 	if (*p)
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3902) 		trace_seq_vprintf(&iter->seq, p, ap);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3903  	kfree(buf);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3904  	return;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3905   print_fmt:
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3906  	trace_seq_vprintf(&iter->seq, fmt, ap);
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3907) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

