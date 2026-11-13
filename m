Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597048;
	b=rN4QTGY7G23WUX9XN5+lLimNAfva+t2HU4o/MslFpuSWeZX335XQAHgyVq+trhl4sbMD
	 JRUOPNt0tzvKGNh2P/rWdd070ESs6bakn9bDPbdJJ9IUgpJsELrj4WB8YlYW5QT9uDN2W
	 R7OCvcF/uSyHlgdQDxk/+i+I5M8cVHvHjSHpbI4uC33IiHe+OihUBchZHU0TPOpPWWaQZ
	 k2T0AaZdYxa0eXCdI4GPqILq5dINQzaNUbeT9WKbILSwSxOwBFBEdqJg5g4pbDZvCy73f
	 zLXhqelkCSqK8ijTryxBJz1BnzNQgmvh6jDEZN93gpXoLsCVzD+8fHAhPST8yRq34Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597048;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WAEOzMDkQXHeFaVJ78vzghFDASGs+HMG8qMN8m4Kh+4=;
	b=YOqwnJzDz20hMPt3mnuUr2OFtrdYx0tebDkvB/wewrMe5qV6Dzuz8iCGLonzwOnuoOtn
	 AN6xrt9jg1mdeJzvJ1lLMl0ALSFWWqlIDZYu99iNocPNIluaVOET6oS6PgkjIAD9zhy+y
	 6djotP962Ig80lqel8JwXElRB0JabcTdnERuZ4fms5zQS1u6jnAMkgQByb5MNQdmo1wqh
	 +XMFaTxZTtCfS9kg5uhgc9mLzbAgiaU1oSfj9x8Q724iVkgi5k+M0l0KR1Xw6NezYdKOs
	 +7rz8ZMKB3HEUne/iubtoYv20ZOhqGgkY6egiaUf7uKAmsr3ba9TDH1GTYmYSAAQ/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cenp1BxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E2606A32D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cenp1BxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF58A1F000C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597047;
	bh=WAEOzMDkQXHeFaVJ78vzghFDASGs+HMG8qMN8m4Kh+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cenp1BxDqSDwZTsEQ+jGLR+1OqBpZu6ZDupWEn3U3uR8YlKg8JMaRWuGQ4tMTC95d
	 M22jJBPOZ1SZseNUVpQW/jxdXzJ1xbY9W2fvLLoC8TYPMOkMvpCJA/lDKD8JLRMbu6
	 LZ2D3Dpig1mZPp8P2GmB9d4vNpeT6giO4+pqrEgK+cE4PZK4cWJ31A1veqbhhm15Es
	 pij84dqsxnQDZxkdD9qI7OyHOPKDUjPVPrjGqhL2gEtXaL5RTxc6aS6GUYECURgETU
	 zjAJKsnCR34T1kmSSdbOqxwqc1DxgWx50+b5qak8pq1gO3Gxe11saQKdcnCNpq1TLQ
	 8FlONx5JLEA+A==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ace304021eso17727101fa.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 11:10:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEdwXOMpKSD3MTRjAs6xiMnubdBjgvlQzWJVNfDJMZWqRtPTNN/kGUKvLb5F4WLvQWFTnah3yOvP7iNCQoi@lists.linux.dev
X-Gm-Message-State: APuU4Z9YvVKtnMxO3+nj/CDe+KwSA5LbmrklspDebf186BLoPlcOD8dw
	ySDqU1/Irnm5jVP5xDdawM4GZqDFB9sACFpWXL+piG0DJZug6o2I3gmq5fmTUJ4GHbPLg0Yu8Rr
	Yk8HAwLgyDCEfwvULYSKFcQANTb1TAnk=
X-Received: by 2002:a2e:ab0c:0:b0:3ae:90:b8a6 with SMTP id 38308e7fff4ca-3ae2b524882mr11616641fa.26.1794597046238;
 Fri, 13 Nov 2026 11:10:46 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202611111143.CWKE7ewK-lkp@intel.com> <32021bd4-e144-4674-a5ed-ef8b38950b7a@oss.qualcomm.com>
In-Reply-To: <32021bd4-e144-4674-a5ed-ef8b38950b7a@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 20:10:32 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ga8+ULra1Fg2a9NOpV=b0uXb57S8=n2LsatLO72JA=PA@mail.gmail.com>
X-Gm-Features: AclHuK_FISev9QdymkiDcQ8s-xIg_N8ybQmVcnLi7gT1LjucOJzp4oodMqBg0ns
Message-ID: <CAJZ5v0ga8+ULra1Fg2a9NOpV=b0uXb57S8=n2LsatLO72JA=PA@mail.gmail.com>
Subject: Re: [rafael-pm:bleeding-edge 9/22] drivers/platform/x86/hp/hp-wmi.c:1057:16:
 error: implicit declaration of function 'devm_battery_hook_register'; did you
 mean 'acpi_battery_hook_register'?
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:18=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> On 11/11/2026 6:46 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm=
.git bleeding-edge
> > head:   51bafe2e7302403a43ba45415bf9a268a7fcaa05
> > commit: fafe4f5166bc3d43e28967efb9ea82b1f456b798 [9/22] Merge branch 'a=
cpi-battery' into bleeding-edge
> > config: x86_64-randconfig-2003-20261111 (https://download.01.org/0day-c=
i/archive/20261111/202611111143.CWKE7ewK-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20261111/202611111143.CWKE7ewK-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202611111143.CWKE7ewK-l=
kp@intel.com/
> >
>
> Addressed the same issue on
> https://lore.kernel.org/all/cbd2aee7-95ae-4d30-8458-b7da2910867f@oss.qual=
comm.com/

Thanks, it should be fixed now.
