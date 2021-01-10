Content-Type: multipart/mixed; boundary="===============0951845037331041527=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1855:42: warning: Uninitialized variable: fw_ver
Date: Sun, 10 Jan 2021 13:27:31 +0800
Message-ID: <202101101327.Ajd5OjSM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0951845037331041527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2ff90100ace886895e4fbb2850b8d5e49d931ed6
commit: 57430471e2fa60a412e220fa3014567e792aaa6f drm/amdgpu: Add support fo=
r USBC PD FW download
date:   10 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:1855:42: warning: Uninitialized =
variable: fw_ver [uninitvar]
    return snprintf(buf, PAGE_SIZE, "%xn", fw_ver);
                                            ^

vim +1855 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

  1836	=

  1837	static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
  1838						 struct device_attribute *attr,
  1839						 char *buf)
  1840	{
  1841		struct drm_device *ddev =3D dev_get_drvdata(dev);
  1842		struct amdgpu_device *adev =3D ddev->dev_private;
  1843		uint32_t fw_ver;
  1844		int ret;
  1845	=

  1846		mutex_lock(&adev->psp.mutex);
  1847		ret =3D psp_read_usbc_pd_fw(&adev->psp, &fw_ver);
  1848		mutex_unlock(&adev->psp.mutex);
  1849	=

  1850		if (ret) {
  1851			DRM_ERROR("Failed to read USBC PD FW, err =3D %d", ret);
  1852			return ret;
  1853		}
  1854	=

> 1855		return snprintf(buf, PAGE_SIZE, "%x\n", fw_ver);
  1856	}
  1857	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0951845037331041527==--

