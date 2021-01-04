Content-Type: multipart/mixed; boundary="===============2226659742175781818=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/platform/surface/surface3-wmi.c:60:14: warning: variable 'status' set but not used
Date: Mon, 04 Jan 2021 15:52:26 +0100
Message-ID: <184b4ec6-65f1-5a22-487b-20cc0fb1b587@redhat.com>
In-Reply-To: <202012291140.j73hBz45-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2226659742175781818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 12/29/20 4:58 AM, kernel test robot wrote:
> Hi Maximilian,
> =

> FYI, the error/warning still remains.
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   dea8dcf2a9fa8cc540136a6cd885c3beece16ec3
> commit: f23027ca3d48b6f93c5994069fb25b73539fdf34 platform/surface: Move S=
urface 3 WMI driver to platform/surface
> date:   9 weeks ago
> config: x86_64-randconfig-r001-20201221 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Df23027ca3d48b6f93c5994069fb25b73539fdf34
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout f23027ca3d48b6f93c5994069fb25b73539fdf34
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    drivers/platform/surface/surface3-wmi.c: In function 's3_wmi_query_blo=
ck':
>>> drivers/platform/surface/surface3-wmi.c:60:14: warning: variable 'statu=
s' set but not used [-Wunused-but-set-variable]
>       60 |  acpi_status status;
>          |              ^~~~~~

I guess fixing this would require something like this:

From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/surface: surface3-wmi: Fix variable 'status' set =
but not used compiler warning

Explictly check the status rather then relying on output.pointer staying
NULL on an error. This silences the following compiler warning:

drivers/platform/surface/surface3-wmi.c:60:14: warning: variable 'status' s=
et but not used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/surface/surface3-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/sur=
face/surface3-wmi.c
index 130b6f52a600..4b7f79c0b78e 100644
--- a/drivers/platform/surface/surface3-wmi.c
+++ b/drivers/platform/surface/surface3-wmi.c
@@ -63,6 +63,10 @@ static int s3_wmi_query_block(const char *guid, int inst=
ance, int *ret)
 =

 	mutex_lock(&s3_wmi_lock);
 	status =3D wmi_query_block(guid, instance, &output);
+	if (ACPI_FAILURE(status)) {
+		error =3D -EIO;
+		goto out_free_unlock;
+	}
 =

 	obj =3D output.pointer;
 =


Maximilian, can you review and/or test this fix please ?

Regards,

Hans

--===============2226659742175781818==--

