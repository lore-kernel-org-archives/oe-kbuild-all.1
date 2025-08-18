Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AD7275AF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498855; cv=none; b=a/CCCLUdmHOsure3wflBkli+C47pIZ2Wh7Pzlf5BCMjCU8mIC6F4Cpy7M+wZz1pLLLP00jHizc35tSYqOPIvRFUBwDXCiE1sA/HKpmwZccyJHOhGlWARu6R0D4m34p+SSU8uPE59moKaE7CjPV8spfybvUNAoT08T9Cfo5yOFms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498855; c=relaxed/simple;
	bh=jCGii2UgR1DubFjNhVV24kwwJVQu4mE/TURwvMamQJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWwdkEaCTS0ZiPZfbQRrFFCVIeTTJyzeTCD5QWmjR5vD7cF838ECHcML/oJtRtdVkxaqxGaMgGNxZ6Q/VzYoPqgBo6Z0CrHyZQyQJgHvibANkg6iPxEL2qLrMKNpbKkLjItV5ao86g1vg2dV7CJhnd/XHVcy4S1ogGDvPYNydkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XqwF+zDh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XqwF+zDh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so2985294f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Aug 2025 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755498850; x=1756103650; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vboU5xoEehUgMZFt48gs99Sfg/+NXyB1MrQfEX3BN2Q=;
        b=XqwF+zDhEtBVet8FpBdvci94MyI6A7hVmLFlDsfRCSpytenRJaryXo6lkRiHOLTNsa
         c+5EuUJW+obLk8Lv+wW58ClIgSSr7G32kyxJeLhQUQTZp1wdFHNITzdHQrxP8cYEHEHa
         2dhqmzDQyQjwkNpah4u2rJwBi3sr/V1RUv12ylaZzf6tOF3cFQw5ZILf2CGcEr7TeF5s
         mTHvTHBmX6usFNPyrXMLfjECaJcNnqIU4opBSxNxbcdy5oTDPjTnmRMUsIOi2EnsD/nd
         uT+kigsnXB5zRJlTmbVzcPWAnniNlPnfb9JIs21wExbLVhCgy34qO5vUPY9Yx4OaHC3u
         XiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755498850; x=1756103650;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vboU5xoEehUgMZFt48gs99Sfg/+NXyB1MrQfEX3BN2Q=;
        b=AJ9YVOBedQGYXVgDvU6UTvZLBmbjfhfatnAoA/45LXuc+uqbAtL1P5gRTLMg5nxQuc
         2qVFhFgQGRUUvT9vzHQvtPXOhutoY+PgsNWxiebrMO34ibWd8C4DSrV+F7VtLeDtHz1u
         eOne7H9kGzTiIbcqQEMx/Hfmqa6JZJGbAz7WaPEa9nF4YWgywStBeOiCwoiL4pbBJmmd
         nxLg8O+jylb7BMK+YVSIsbNsTq9NrVSBtT1OPa0bS6NdSLnCT4FWfc2KxXreOma0IRbj
         MYW+ShVG3xtn9x6EKyHWxeq9Xwn9ujEKoyENQP+nIvvBnADbvrTJDZ+0nPc/E7wHl5M5
         ZaDg==
X-Forwarded-Encrypted: i=1; AJvYcCW8S4oPuJ8oWNx5lBfzTfz5M8Vh1AKIyS3rKqLWgEvXKhQL82aAZ7tpVX23iVeaVZJYvHIq9pPDFcPQxnhb@lists.linux.dev
X-Gm-Message-State: AOJu0YzVsYhT3+d0Pe3EFG+4zOcnS17BzUuLrytP/2TrkOajz84VlZ3k
	5FN4FWE4SiurQDlZb8ucN+pjVKo9v0uZM3ypl0gOY/FNjKqMU51iJfTXVkJ+gIQuNyFD0g4fiT7
	PC+Ta
X-Gm-Gg: ASbGncsmYuP5guP98TKkn5WfgGOGBqVVP8jubuL56N6nad2mAdowbpetiDuT+tMfuZS
	TN5DrrJjSfRqJjhEzlMNpQOtlmh6LJUDqQADBiJCswRdA7mCyY49IiIGzIlTCBg1JEHCCcWbvMo
	noVbkWwM9aKSNZ+d/DojFUeKn8daDBY4muopoq1tGJrDcnk8kDlFWMZv5icVnZf37VFLfuf3efU
	lJn43mtZIiNblj67x/AlYbLUadvUo7xjplna1+34KLCqJquaPMzBLTti1stVRDdlr+Zrezo2A4M
	MJ2CAWw7KkcIVut+iOY4S9Ee9Lia/SqSjERBwMda962vSnWAuzSJXvJIdXFe0r4/LUAyQl6mKp2
	3oTeC6N5OXiSWhMTH1DDAafUWVSUwwm9WAEOpxuxQ5xw=
X-Google-Smtp-Source: AGHT+IEcL9XvpvVrTZJabDptBXonFfKX8kZQE+VLqoofN9e3zCBpLdnrziNE+gZOjAV0cFhS0TiOPg==
X-Received: by 2002:a05:6000:3102:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3bc6a28004bmr5124234f8f.48.1755498850198;
        Sun, 17 Aug 2025 23:34:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a22210a65sm118913085e9.6.2025.08.17.23.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:34:09 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:34:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zong Jiang <quic_zongjian@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [tty:tty-testing 8/24] drivers/tty/serial/qcom_geni_serial.c:274
 get_port_from_line() error: Calling ida_alloc_range() with a 'max' argument
 which is a power of 2. -1 missing?
Message-ID: <202508180815.R2nDyajs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   7cd9f5d6c5a3f31d2b282d31ddc4d78ff83a5c08
commit: 9391ab1ed9b3fe0d1af7d7858d9bf42f476628c8 [8/24] serial: qcom-geni: Make UART port count configurable via Kconfig
config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180815.R2nDyajs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508180815.R2nDyajs-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:274 get_port_from_line() error: Calling ida_alloc_range() with a 'max' argument which is a power of 2. -1 missing?

Old smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:1931 qcom_geni_serial_probe() warn: missing unwind goto?

vim +/max +274 drivers/tty/serial/qcom_geni_serial.c

c3e7966c60745f Zong Jiang                  2025-08-12  260  static struct qcom_geni_serial_port *get_port_from_line(int line, bool console, struct device *dev)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  261  {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  262  	struct qcom_geni_serial_port *port;
9391ab1ed9b3fe Zong Jiang                  2025-08-12  263  	int nr_ports = console ? GENI_UART_CONS_PORTS : CONFIG_SERIAL_QCOM_GENI_UART_PORTS;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  264  
a53be6945f5123 Viken Dadhaniya             2025-03-27  265  	if (console) {
a53be6945f5123 Viken Dadhaniya             2025-03-27  266  		if (line < 0 || line >= nr_ports)
a53be6945f5123 Viken Dadhaniya             2025-03-27  267  			return ERR_PTR(-ENXIO);
a53be6945f5123 Viken Dadhaniya             2025-03-27  268  
a53be6945f5123 Viken Dadhaniya             2025-03-27  269  		port = &qcom_geni_console_port;
a53be6945f5123 Viken Dadhaniya             2025-03-27  270  	} else {
a53be6945f5123 Viken Dadhaniya             2025-03-27  271  		int max_alias_num = of_alias_get_highest_id("serial");
a53be6945f5123 Viken Dadhaniya             2025-03-27  272  
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  273  		if (line < 0 || line >= nr_ports)
a53be6945f5123 Viken Dadhaniya             2025-03-27 @274  			line = ida_alloc_range(&port_ida, max_alias_num + 1, nr_ports, GFP_KERNEL);

ida_alloc_range() range parameters are inclusive so this should be

	ida_alloc_range(&port_ida, max_alias_num + 1, nr_ports - 1, GFP_KERNEL);

a53be6945f5123 Viken Dadhaniya             2025-03-27  275  		else
a53be6945f5123 Viken Dadhaniya             2025-03-27  276  			line = ida_alloc_range(&port_ida, line, nr_ports, GFP_KERNEL);

same here

a53be6945f5123 Viken Dadhaniya             2025-03-27  277  
a53be6945f5123 Viken Dadhaniya             2025-03-27  278  		if (line < 0)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  279  			return ERR_PTR(-ENXIO);
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  280  
c3e7966c60745f Zong Jiang                  2025-08-12  281  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
c3e7966c60745f Zong Jiang                  2025-08-12  282  		if (!port)
c3e7966c60745f Zong Jiang                  2025-08-12  283  			return ERR_PTR(-ENOMEM);
c3e7966c60745f Zong Jiang                  2025-08-12  284  
c3e7966c60745f Zong Jiang                  2025-08-12  285  		port->uport.iotype = UPIO_MEM;
c3e7966c60745f Zong Jiang                  2025-08-12  286  		port->uport.ops = &qcom_geni_uart_pops;
c3e7966c60745f Zong Jiang                  2025-08-12  287  		port->uport.flags = UPF_BOOT_AUTOCONF;
c3e7966c60745f Zong Jiang                  2025-08-12  288  		port->uport.line = line;
a53be6945f5123 Viken Dadhaniya             2025-03-27  289  	}
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  290  	return port;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  291  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

