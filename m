Content-Type: multipart/mixed; boundary="===============3004274870456708170=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 3948/12912] net/core/sysctl_net_core.c:129:42: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Thu, 28 May 2020 15:11:04 +0200
Message-ID: <20200528131104.GB13108@lst.de>
In-Reply-To: <202005281818.RrAbGV9J%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3004274870456708170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix below:

---
>From 9fae1037a055b2d4c525e1bf36225641b0217a8d Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Thu, 28 May 2020 15:05:46 +0200
Subject: net/sysctl: use cpumask_parse in flow_limit_cpu_sysctl

cpumask_parse_user works on __user pointers, so this is wrong now.

Fixes: 32927393dc1c ("sysctl: pass kernel pointers to ->proc_handler")
Reported-by: build test robot <lkp@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/core/sysctl_net_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index b109cc8a6dd848..f93f8ace6c5619 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -128,7 +128,7 @@ static int flow_limit_cpu_sysctl(struct ctl_table *tabl=
e, int write,
 		return -ENOMEM;
 =

 	if (write) {
-		ret =3D cpumask_parse_user(buffer, *lenp, mask);
+		ret =3D cpumask_parse(buffer, mask);
 		if (ret)
 			goto done;
 =

-- =

2.26.2

--===============3004274870456708170==--

